# Use official Ubuntu image
FROM ubuntu:latest

# Prevent prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Update & install necessary packages
RUN apt-get update && apt-get upgrade -y && \
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
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set UTF-8 locale
RUN locale-gen en_US.UTF-8  
ENV LANG=en_US.UTF-8  
ENV LANGUAGE=en_US:en  
ENV LC_ALL=en_US.UTF-8  

# Set working directory
WORKDIR /root

# Copy the startup script
COPY start.sh /start.sh

# Make it executable
RUN chmod +x /start.sh

# Run the startup script when container starts
CMD ["/start.sh"]
