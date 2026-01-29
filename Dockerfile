FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    ca-certificates

# Instala Jellyfin
RUN curl -fsSL https://repo.jellyfin.org/install-debian.sh | bash && \
    apt-get update && apt-get install -y jellyfin

# Instala FFmpeg NVENC oficial do Jellyfin
RUN wget https://repo.jellyfin.org/releases/server/debian/versions/ffmpeg/jellyfin-ffmpeg_10.9.0-1_amd64.deb && \
    apt install -y ./jellyfin-ffmpeg_10.9.0-1_amd64.deb && \
    rm jellyfin-ffmpeg_10.9.0-1_amd64.deb

EXPOSE 8096
CMD ["jellyfin"]

