ARG BUILD_FROM=ghcr.io/home-assistant/base-debian:trixie
FROM ${BUILD_FROM}

# Install Python and git
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone the repository
RUN git clone https://github.com/goddade/wyoming_gtts.git .

# Install the Python dependencies (matching your local tests)
RUN pip3 install --no-cache-dir wyoming==1.5.4 protobuf==3.20.3

# Copy the start script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

ENTRYPOINT [ "/run.sh" ]
