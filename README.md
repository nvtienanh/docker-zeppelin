# Apache Zeppelin

[![CI status](https://github.com/nvtienanh/docker-zeppelin/workflows/CI/badge.svg?branch=0.8.2-alpine)](https://github.com/nvtienanh/docker-zeppelin/actions?query=branch%3A+branch%3A0.8.2-alpine++)
[![Docker Version](https://images.microbadger.com/badges/version/nvtienanh/zeppelin:0.8.2-alpine.svg)](https://hub.docker.com/r/nvtienanh/zeppelin/)
[![Docker Pulls](https://img.shields.io/docker/pulls/nvtienanh/zeppelin)](https://hub.docker.com/r/nvtienanh/zeppelin/)
[![Docker Layers](https://img.shields.io/microbadger/layers/nvtienanh/zeppelin/0.8.2-alpine)](https://hub.docker.com/r/nvtienanh/zeppelin/)

Docker image infomation:
* Linux: alphine `3.9`
* Spark `2.4.4`
* Hadoop `3.2.1`
* Zeppelin `0.8.2` (Binary package with all interpreters)
* Miniconda `4.7.12.1`
* Python `3.7` supports Pyspark, Matplotlib, ...

# Example Usage

For example usage see [docker-compose.yml](./docker-compose.yml) and [SANSA-Notebooks repository](https://github.com/SANSA-Stack/SANSA-Notebooks).

# Dev
Start Hadoop/Spark cluster with Zeppelin notebook:
```
make up
```
Tear down Hadoop/Spark cluster with Zeppelin notebook:
```
make down
```
Bash into Zeppelin container:
```
make bash
```
Build and run Zeppelin separately:
```
make up
docker stop dockerzeppelin_zeppelin_1 && docker rm dockerzeppelin_zeppelin_1
make run
```
Build Zeppelin:
```
make build
```
For more details see the Makefile.
