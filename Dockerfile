FROM tutum/curl:trusty
MAINTAINER Feng Honglin <hfeng@tutum.co>

ADD run.sh /run.sh
RUN chmod +x /run.sh
ENV DOCKER_VERSION **ChangeMe**

CMD ["/run.sh"]
