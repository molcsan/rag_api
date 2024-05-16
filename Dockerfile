# Dockerfile.db
#FROM ankane/pgvector:latest as db
#
#ENV POSTGRES_DB=mydatabase
#ENV POSTGRES_USER=myuser
#ENV POSTGRES_PASSWORD=mypassword

#VOLUME /var/lib/postgresql/data
#EXPOSE 5433:5432

FROM python:3.10 as main

WORKDIR /app

RUN apt-get update \
    && apt-get install -y pandoc netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

EXPOSE 8000:8000/tcp

CMD ["python", "main.py"]
