FROM advplyr/audiobookshelf:2.20.0

RUN apt-get update && apt-get install wget curl sudo bash tini -y \
        && wget https://github.com/mikefarah/yq/releases/download/v4.25.1/yq_linux_arm.tar.gz -O - |\
        tar xz && mv yq_linux_arm /usr/bin/yq

ENV APP_HOST audiobookshelf.embassy
ENV APP_PORT 13378
ENV TOR_PROXY_IP embassy
ENV TOR_PROXY_PORT 9050

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/*.sh
