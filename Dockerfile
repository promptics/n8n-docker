FROM n8nio/n8n

COPY entrypoint.sh /entrypoint.sh
COPY create-user.js /create-user.js

ENTRYPOINT ["/entrypoint.sh"]
