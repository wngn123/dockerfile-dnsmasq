
FROM alpine:latest

LABEL maintainer wngn123@163.com

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk --no-cache add dnsmasq \
    && mkdir -p /etc/dnsmasq.d

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories \
 && apk -U upgrade \
 && apk add --no-cache tzdata dnsmasq busybox-extras bind-tools \
 && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
 && echo Asia/Shanghai > /etc/timezone \
 && echo "" >> /etc/profile \
 && echo "alias ll='ls -alF'" >> /etc/profile \
 && echo "" >> /etc/profile \
 && source /etc/profile 

ADD dnsmasq-conf.tar.gz /etc/

COPY build-dnsmasq-conf.sh /build-dnsmasq-conf.sh
COPY entrypoint.sh /entrypoint.sh
COPY startup-dnsmasq.sh /startup-dnsmasq.sh

RUN chmod a+x /build-dnsmasq-conf.sh \
 && chmod a+x /entrypoint.sh \
 && chmod a+x /startup-dnsmasq.sh \
 && echo success

EXPOSE 53 53/udp

ENTRYPOINT ["/entrypoint.sh"]

CMD /startup-dnsmasq.sh

