FROM python:latest

WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY server.py /app/

EXPOSE 5000

CMD ["/bin/sh", "-c", "uvicorn server:app --host=0.0.0.0 --port 5000"]
