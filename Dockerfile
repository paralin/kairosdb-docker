FROM java:8-alpine
ENV KAIROS_VERSION 1.1.1

ADD ./container-startup.sh /container-startup.sh
RUN apk --update add ca-certificates curl bash && \
    curl -L https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 > /usr/bin/dumb-init && \
    chmod +x /usr/bin/dumb-init
RUN mkdir -p /opt && cd /opt/ && \
    curl -L https://github.com/kairosdb/kairosdb/releases/download/v${KAIROS_VERSION}/kairosdb-${KAIROS_VERSION}-1.tar.gz | \
    tar zxfp -

EXPOSE 4242 8083 8080
ENTRYPOINT ["/usr/bin/dumb-init", "/container-startup.sh"]
CMD ["run"]
