FROM alpine
ADD post.sh /bin/
RUN chmod +x /bin/post.sh
RUN apk -Uuv add curl ca-certificates
ENTRYPOINT /bin/post.sh
