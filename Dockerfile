FROM alpine
MAINTAINER support@tutum.co

RUN apk --update add curl
ADD run.sh /run.sh
ENV DOCKER_VERSION **ChangeMe**
CMD ["/run.sh"]
