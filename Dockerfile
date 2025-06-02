FROM n8nio/n8n

# Install curl used by the custom entrypoint
RUN apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY create-user.js /create-user.js

ENTRYPOINT ["/entrypoint.sh"]
