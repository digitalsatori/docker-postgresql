FROM postgres:9.5
MAINTAINER sebastien.beau@akretion.com

COPY dev-docker-entrypoint.sh /
ENTRYPOINT ["/dev-docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
