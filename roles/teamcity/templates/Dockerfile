FROM {{ teamcity_agent.docker.name }}:{{ teamcity_agent.docker.tag }}

USER root

RUN apt-get update -y && \
    apt-get install -y \
    dirmngr \
    gpg-agent \
    software-properties-common \
    apt-transport-https \
    wget \
    curl \
    rsync \
    zip \
    bzip2 \
    git \
    openssh-client \
    libarchive-dev
