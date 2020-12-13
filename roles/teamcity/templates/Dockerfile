FROM {{ teamcity_agent.docker.name }}:{{ teamcity_agent.docker.tag }}

USER root

RUN apt-get update -y && \
    apt-get install -y dirmngr \
                       wget \
                       curl \
                       rsync \
                       zip \
                       bzip2 \
                       git \
                       openssh-client \
                       libarchive-dev

# https://docs.docker.com/engine/install/ubuntu/
# + disable docker service

RUN apt-get update -y && \
    apt-get install -y apt-transport-https \
                       ca-certificates \
                       curl \
                       gnupg-agent \
                       software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-cache policy docker-ce && \
    apt-get update && \
    apt-get install -y docker-ce \
                       docker-ce-cli \
                       containerd.io \
                       systemd && \
    systemctl disable docker && \
    apt-get clean all && \
    usermod -aG docker buildagent

# https://github.com/JetBrains/teamcity-docker-agent/blob/master/ubuntu/Dockerfile

VOLUME /var/lib/docker

COPY run-docker.sh /services/run-docker.sh

RUN chown -R buildagent:buildagent /services

# USER buildagent
