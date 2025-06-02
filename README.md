# n8n-docker

This repository contains a simple Docker Compose setup for running [n8n](https://n8n.io/) together with PostgreSQL (with the `pgvector` extension) and MongoDB.

## Usage

1. Ensure Docker Compose is installed on your machine.
2. Clone this repository and run:

```bash
docker compose up -d
```

The compose file exposes n8n on port `5678`. A volume is created for the n8n data so your workflows persist across container restarts.

The PostgreSQL service uses the `pgvector/pgvector` image and initializes the `vector` extension on first start using the script in `postgres/init-vector.sql`.

MongoDB is started with a default user of `root` and password `example`. Adjust the credentials in `docker-compose.yml` as needed.

## Services

- **n8n**: Low-code workflow automation tool.
- **PostgreSQL**: Database for n8n configured with the `pgvector` extension.
- **MongoDB**: Additional database which can be used by custom workflows.

## Volumes

- `n8n_data` – stores n8n configuration and workflows
- `postgres_data` – stores PostgreSQL data
- `mongodb_data` – stores MongoDB data

## Starting and Stopping

Start the stack:

```bash
docker compose up -d
```

Stop the stack:

```bash
docker compose down
```

