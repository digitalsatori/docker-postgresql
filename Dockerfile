FROM postgres:9.6
MAINTAINER sebastien.beau@akretion.com

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y postgresql-contrib && \
    apt-get clean

COPY dev-docker-entrypoint.sh /
ENTRYPOINT ["/dev-docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
