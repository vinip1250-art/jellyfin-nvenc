FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    ca-certificates

# Adiciona repositório Jellyfin
RUN curl -fsSL https://repo.jellyfin.org/install-debian.sh | bash

# Instala Jellyfin + FFmpeg NVENC oficial
RUN apt-get update && apt-get install -y \
    jellyfin \
    jellyfin-ffmpeg

EXPOSE 8096
CMD ["jellyfin"]
