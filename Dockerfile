FROM jellyfin/jellyfin:latest

# Instala dependências
RUN apt-get update && apt-get install -y curl xz-utils

# Baixa FFmpeg NVENC estático (mirror confiável)
RUN curl -L https://objects.githubusercontent.com/github-production-release-asset-2e65be/2917872/ffmpeg-nvenc-linux64.tar.xz -o ffmpeg.tar.xz && \
    tar -xf ffmpeg.tar.xz && \
    mv ffmpeg-nvenc-linux64/ffmpeg /usr/local/bin/ffmpeg && \
    mv ffmpeg-nvenc-linux64/ffprobe /usr/local/bin/ffprobe && \
    chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe && \
    rm -rf ffmpeg* *.tar.xz
