FROM python:3.8-alpine

COPY requirements.txt /app/

RUN pip3 install --no-cache-dir -r /app/requirements.txt

COPY app.py /app/

WORKDIR /app

CMD ["python3", "app.py"]