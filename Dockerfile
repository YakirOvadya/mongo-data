FROM mongo:7.0

COPY users.json /docker-entrypoint-initdb.d/