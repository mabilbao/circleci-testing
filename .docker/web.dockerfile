FROM nginx:mainline-alpine

ADD ./.docker/web/default.conf /etc/nginx/conf.d/default.conf