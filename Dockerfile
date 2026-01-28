FROM jellyfin/jellyfin:latest

# Instala dependências básicas
RUN apt-get update && apt-get install -y curl tar

# Baixa e instala FFmpeg NVENC estático
RUN curl -L https://github.com/BtbN/FFmpeg-Builds/releases/latest/download/ffmpeg-master-latest-linux64-gpl-shared.tar.xz -o ffmpeg.tar.xz && \
    tar -xf ffmpeg.tar.xz && \
    cp ffmpeg-*/ffmpeg /usr/local/bin/ffmpeg && \
    cp ffmpeg-*/ffprobe /usr/local/bin/ffprobe && \
    chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe && \
    rm -rf ffmpeg* *.tar.xz
