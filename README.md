# n8n-docker

This repository contains a simple Docker Compose setup for running [n8n](https://n8n.io/) together with PostgreSQL (with the `pgvector` extension) and MongoDB.
The provided `Dockerfile` extends the official n8n image and installs `curl` so the startup script can wait for n8n to become reachable.

## Usage

1. Ensure Docker Compose is installed on your machine.
2. Clone this repository and run:

```bash
docker compose up -d --build
```

The compose file exposes n8n on port `5678`. A volume is created for the n8n data so your workflows persist across container restarts.
On first start, if no user exists, an owner account will be created automatically
using the credentials from the environment variables `N8N_DEFAULT_EMAIL` and
`N8N_DEFAULT_PASSWORD` (see `docker-compose.yml`). You can also configure the
name of the initial user with `N8N_DEFAULT_FIRSTNAME` and
`N8N_DEFAULT_LASTNAME`.

The PostgreSQL service uses the `pgvector/pgvector` image and initializes the `vector` extension on first start using the script in `postgres/init-vector.sql`.

MongoDB is started with a default user of `root` and password `example`. Adjust the credentials in `docker-compose.yml` as needed.

Adminer is exposed on port `8081` and allows managing the PostgreSQL database through a browser.

## Services

- **n8n**: Low-code workflow automation tool.
- **PostgreSQL**: Database for n8n configured with the `pgvector` extension.
- **MongoDB**: Additional database which can be used by custom workflows.
- **Stirling-PDF**: Tools for processing PDF files.
- **Adminer**: Browser-based interface for PostgreSQL management.

## Endpoints

- **n8n UI**: <http://localhost:5678>
- **n8n REST API**: <http://localhost:5678/rest>
- **Stirling-PDF**: <http://localhost:8080>
- **Adminer**: <http://localhost:8081>
- **PostgreSQL**: `postgres://n8n:n8n@localhost:5432/n8n`
- **MongoDB**: `mongodb://root:example@mongodb:27017` (internal only)


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

