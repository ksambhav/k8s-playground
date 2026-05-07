FROM ghcr.io/cloudnative-pg/postgresql:18
USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       postgresql-18-cron \
    && rm -rf /var/lib/apt/lists/*
USER 1000
