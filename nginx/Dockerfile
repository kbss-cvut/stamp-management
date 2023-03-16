FROM nginx:latest

ENV DOCKERVERSION=20.10.5

COPY ./run.sh /run.sh

RUN mkdir -p /root/.docker
RUN touch /root/.docker/config.json

RUN apt-get update \
 && apt-get install -y fcgiwrap sudo \
 && apt-get clean \
 && curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
 && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 -C /usr/local/bin docker/docker \
 && rm docker-${DOCKERVERSION}.tgz \
 && curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
 && chmod +x /usr/local/bin/docker-compose

RUN echo 'www-data ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

CMD /run.sh
