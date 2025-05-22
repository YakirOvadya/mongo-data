FROM mongo:8.0

COPY users.json /docker-entrypoint-initdb.d/