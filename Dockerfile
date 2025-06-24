# Use official Ubuntu image
FROM ubuntu:latest

# Set non-interactive for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update & install packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    sudo \
    systemd \
    iproute2 \
    iputils-ping \
    net-tools \
    curl \
    wget \
    gnupg \
    lsb-release \
    ca-certificates \
    software-properties-common \
    openssh-client \
    vim \
    nano \
    git \
    unzip \
    tar \
    zip \
    locales \
    man \
    bash-completion \
    htop \
    screen \
    tmux \
    rsync \
    python3 \
    python3-pip \
    build-essential \
    tmate \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set locale
RUN locale-gen en_US.UTF-8  
ENV LANG=en_US.UTF-8  
ENV LANGUAGE=en_US:en  
ENV LC_ALL=en_US.UTF-8  

# Set working directory
WORKDIR /root

# Optional: open port (not required for tmate)
EXPOSE 22

# Default shell
CMD ["/bin/bash"]
