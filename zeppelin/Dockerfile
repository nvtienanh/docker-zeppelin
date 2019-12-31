ARG SPARK_BASE
FROM nvtienanh/spark-base:${SPARK_BASE}

ARG BUILD_DATE
ARG VCS_REF
ARG ZEPPELIN_VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.name="Apache Airflow" \
        org.label-schema.description="An Apache Airflow docker image based on Alpine Linux" \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/nvtienanh/docker-airflow" \
        org.label-schema.vendor="nvtienanh" \
        org.label-schema.version=$ZEPPELIN_VERSION \
        org.label-schema.schema-version="1.0"

RUN apk add --no-cache wget
RUN set -x \
    && apk add --no-cache wget \
    && curl -fSL "https://www-eu.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VERSION}/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz" -o /tmp/zeppelin.tgz \
    && tar -xzvf /tmp/zeppelin.tgz -C /opt/ \
    && mv /opt/zeppelin-* /opt/zeppelin \
    && rm /tmp/zeppelin.tgz \
    && apk del wget


# COPY zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz /tmp/zeppelin.tgz
# RUN tar -xvzf /tmp/zeppelin.tgz -C /opt/ \
#     && mv /opt/zeppelin-${ZEPPELIN_VERSION}-bin-all /opt/zeppelin \
#     && rm /tmp/zeppelin.tgz \
#     && cd /

# ENV SPARK_SUBMIT_OPTIONS "--jars /opt/zeppelin/sansa-examples-spark-2016-12.jar"

WORKDIR /opt/zeppelin

CMD ["/opt/zeppelin/bin/zeppelin.sh"]
