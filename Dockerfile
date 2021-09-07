FROM alpine:latest
RUN mkdir /app
COPY config.txt /app/config.txt
RUN apk update
RUN apk add curl
RUN apk add nginx && touch /build-2.0 && mkdir -p /run/nginx && touch /index.html
COPY default.conf /etc/nginx/conf.d/
COPY new-file.cfg /tmp/new-file.cfg
CMD ["nginx", "-g", "daemon off;"]
