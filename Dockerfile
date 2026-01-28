FROM ubuntu:22.04

# Dependências básicas
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    gnupg \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Adiciona repositório Jellyfin e instala Jellyfin + FFmpeg NVENC
RUN curl -fsSL https://repo.jellyfin.org/install-debuntu.sh | bash && \
    apt-get update && \
    apt-get install -y jellyfin jellyfin-ffmpeg && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8096
CMD ["jellyfin"]
