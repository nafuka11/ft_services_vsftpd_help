FROM alpine:3.12

ENV USER=user42
ENV PASSWORD=user42

RUN apk add --no-cache vsftpd openssl && \
    openssl req -x509 -newkey rsa:2048 -nodes -keyout /etc/ssl/private/server.pem \
        -sha256 -days 356 -subj "/C=JP/ST=Tokyo/L=Minato-ku/O=42Tokyo/OU=42Tokyo/CN=localhost" -out /etc/ssl/certs/server.crt && \
    adduser -D -G nogroup ${USER} && \
    echo "${USER}:${PASSWORD}" | chpasswd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 42000-42010

CMD /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
