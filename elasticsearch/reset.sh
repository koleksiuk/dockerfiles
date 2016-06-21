#!/bin/bash

if [ "$1" == "dev" ]; then
    HTTP_PORT="9201";
    SERVICE_PORT="9301";
elif [ "$1" == "test" ]; then
    HTTP_PORT="9200";
    SERVICE_PORT="9300";
else
    echo "Uknown environment $1 - [test, dev] available";
    exit 1;
fi

docker stop elasticsearch-$1
docker rm -f elasticsearch-$1

docker run --name=elasticsearch-$1 -p $HTTP_PORT:9200 -p $SERVICE_PORT:9300 -d konole/elasticsearch-lf
