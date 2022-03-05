FROM alpine:latest

ADD entrypoint.sh /opt/entrypoint.sh

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && chmod +x /opt/entrypoint.sh \
 && wget -O nezha.tar.gz https://github.com/naiba/nezha/releases/download/v0.12.3/nezha-agent_linux_amd64.tar.gz \
 && tar -zxvf nezha.tar.gz \
 && chmod +x /nezha-agent

ENTRYPOINT ["sh", "-c", "/opt/entrypoint.sh"]
