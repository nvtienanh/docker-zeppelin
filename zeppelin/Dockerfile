ARG SPARK_BASE
FROM nvtienanh/spark-base:${SPARK_BASE}

ARG BUILD_DATE
ARG VCS_REF
ARG ZEPPELIN_VERSION

LABEL org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.name="Apache Zeppelin" \
        org.label-schema.description="An Apache Zeppelin docker image based on Debian Linux" \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/nvtienanh/docker-zeppelin" \
        org.label-schema.vendor="nvtienanh" \
        org.label-schema.version=$ZEPPELIN_VERSION \
        org.label-schema.schema-version="1.0"

RUN apt-get update && apt-get install wget
RUN set -x \
    && curl -fSL "https://www-eu.apache.org/dist/zeppelin/zeppelin-${ZEPPELIN_VERSION}/zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz" -o /tmp/zeppelin.tgz \
    && tar -xzvf /tmp/zeppelin.tgz -C /opt/ \
    && mv /opt/zeppelin-* /opt/zeppelin \
    && rm /tmp/zeppelin.tgz

# COPY zeppelin-${ZEPPELIN_VERSION}-bin-all.tgz /tmp/zeppelin.tgz
# RUN tar -xvzf /tmp/zeppelin.tgz -C /opt/ \
#     && mv /opt/zeppelin-${ZEPPELIN_VERSION}-bin-all /opt/zeppelin \
#     && rm /tmp/zeppelin.tgz \
#     && cd /

# ENV SPARK_SUBMIT_OPTIONS "--jars /opt/zeppelin/sansa-examples-spark-2016-12.jar"

WORKDIR /opt/zeppelin

CMD ["/opt/zeppelin/bin/zeppelin.sh"]
