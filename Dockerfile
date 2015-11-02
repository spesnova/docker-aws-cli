FROM alpine:3.2
MAINTAINER Seigo Uchida <spesnova@gmail.com> (@spesnova)

WORKDIR /root

RUN apk --update add python openssl \
      && rm -rf /var/cache/apk/* \
      && wget https://bootstrap.pypa.io/get-pip.py \
      && /usr/bin/python get-pip.py \
      && rm get-pip.py \
      && /usr/bin/pip install awscli

CMD ["/bin/sh"]
