TAG := 0.8.1
up:
	docker network create spark-net
	docker-compose up -d

down:
	docker-compose down
	docker network rm spark-net

bash:
	docker exec -it docker-zeppelin_zeppelin_1 bash

run:
	docker build -t zeppelin ./zeppelin/.
	docker run -it --rm --net spark-net -p 80:8080 -v $(shell pwd)/notebook:/opt/zeppelin/notebook -v $(shell pwd)/zeppelin-0.8.1-bin-all:/opt/zeppelin zeppelin /bin/bash
	#docker run -it --rm --net spark-net -p 80:8080 -v $(shell pwd)/notebook:/opt/zeppelin/notebook zeppelin /opt/zeppelin/bin/zeppelin.sh

build:
	docker build -t nvtienanh/zeppelin:$(TAG) ./zeppelin/.
