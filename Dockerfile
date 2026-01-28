FROM ubuntu:22.04

# Dependências básicas
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    gnupg \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Instala Jellyfin
RUN curl -fsSL https://repo.jellyfin.org/install-debuntu.sh | bash && \
    apt-get update && apt-get install -y jellyfin && \
    rm -rf /var/lib/apt/lists/*

# Instala FFmpeg NVENC estático (John Van Sickle)
RUN wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && \
    tar -xf ffmpeg-release-amd64-static.tar.xz && \
    mv ffmpeg-*-static/ffmpeg /usr/local/bin/ffmpeg && \
    mv ffmpeg-*-static/ffprobe /usr/local/bin/ffprobe && \
    chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe && \
    rm -rf ffmpeg-*-static ffmpeg-release-amd64-static.tar.xz

# Expõe a porta do Jellyfin
EXPOSE 8096

CMD ["jellyfin"]
