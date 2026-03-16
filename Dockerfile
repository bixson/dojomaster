FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    bc \
    procps \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/tsl0922/ttyd/releases/download/1.7.4/ttyd.x86_64 -O /usr/local/bin/ttyd \
    && chmod +x /usr/local/bin/ttyd

WORKDIR /game

COPY dojomaster.sh .
RUN chmod +x dojomaster.sh

EXPOSE 7681

CMD ["ttyd", "--port", "7681", "--writable", "/game/dojomaster.sh"]
