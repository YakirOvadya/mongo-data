#!/bin/bash

echo ">>> Starting manual mongoimport of users.json"

mongoimport --db test --collection users --file /data/users.json --jsonArray