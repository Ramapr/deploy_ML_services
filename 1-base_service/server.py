from fastapi import FastAPI
import requests
import json
from redis import Redis
import os

app = FastAPI()

TOKEN = None

def connect():
    r = Redis(host='',
              port=6379,
              db=0,
              password='',
             )
    return r


@app.on_event("startup")
async def startup_event():
    r = None
    while r is None or r.status_code == 429:
        r = requests.get("https://host-name/module/get_secret_number", timeout=200)
    global TOKEN
    TOKEN = json.loads(r.content.decode())["secret_number"]
    
    REPLICA_NAME = os.environ["REPLICA_NAME"]
    HOST = os.environ["HOST"]
    PORT = os.environ["PORT"]

    rc = connect()
    rc.lpush("web_app", REPLICA_NAME)
    rc.hset(REPLICA_NAME, "host", HOST)
    rc.hset(REPLICA_NAME, "port", PORT)
    

@app.on_event("shutdown")
async def shutdown_event():
    pass



@app.get("/return_secret_number")
async def get_number():
    global TOKEN
    return {'secret_number': TOKEN}
