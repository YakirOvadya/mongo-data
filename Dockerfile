FROM mongo:7.0

COPY users.json /data/users.json

COPY mongoimport.sh /docker-entrypoint-initdb.d/init.sh

RUN chmod +x /docker-entrypoint-initdb.d/init.sh