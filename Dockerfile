FROM python:3.11.6-alpine3.18
LABEL authors="sensiblenoob@gmail.com"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apk update && apk add --no-cache \
    python3-dev gcc libc-dev postgresql-client netcat-openbsd

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

COPY . .

# Ensure entrypoint is executable
RUN chmod +x /app/entrypoint.sh
