FROM alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk -Uuv add tzdata

ADD post.sh /bin/

ENTRYPOINT /bin/post.sh
