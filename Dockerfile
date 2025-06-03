FROM n8nio/n8n

# Install curl used by the custom entrypoint
USER root
RUN if command -v apt-get >/dev/null; then \
        apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*; \
    elif command -v apk >/dev/null; then \
        apk add --no-cache curl; \
    else \
        echo "No supported package manager found" && exit 1; \
    fi
USER node

COPY entrypoint.sh /entrypoint.sh
COPY create-user.js /create-user.js

ENTRYPOINT ["/entrypoint.sh"]
