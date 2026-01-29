FROM debian:bookworm

# Dependências
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gnupg \
    ca-certificates

# Adiciona chave do Jellyfin
RUN curl -fsSL https://repo.jellyfin.org/jellyfin_team.gpg.key | gpg --dearmor -o /usr/share/keyrings/jellyfin.gpg

# Adiciona repositório Jellyfin
RUN echo "deb [signed-by=/usr/share/keyrings/jellyfin.gpg] https://repo.jellyfin.org/debian bookworm main" \
    > /etc/apt/sources.list.d/jellyfin.list

# Instala Jellyfin + FFmpeg NVENC
RUN apt-get update && apt-get install -y \
    jellyfin \
    jellyfin-ffmpeg

EXPOSE 8096
CMD ["jellyfin"]
