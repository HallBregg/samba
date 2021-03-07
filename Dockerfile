FROM alpine:latest

RUN apk add --update \
    samba-common-tools \
    samba-client \
    samba-server \
    && rm -rf /var/cache/apk/*

EXPOSE 445/tcp

CMD ["smbd", "--interactive", "--log-stdout"]
