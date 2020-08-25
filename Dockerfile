FROM nginx:1.13.8-alpine

RUN mkdir -p /docker-volumes/etc/letsencrypt/live/rezepte.rafrey.com
RUN mkdir -p /docker-volumes/etc/letsencrypt
RUN touch /docker-volumes/etc/letsencrypt/live/rezepte.rafrey.com/fullchain.pem
RUN touch /docker-volumes/etc/letsencrypt/live/rezepte.rafrey.com/privkey.pem
RUN touch /docker-volumes/etc/letsencrypt/ssl-dhparams.pem

RUN rm /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d/default.conf

RUN mkdir /scripts
WORKDIR /scripts
COPY start.sh /scripts/start.sh
