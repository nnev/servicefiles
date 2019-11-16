# Builder
FROM node:10-slim as builder

RUN apt-get update \
 && apt-get install -y git python build-essential libicu-dev

RUN git clone "https://github.com/matrix-org/freebindfree.git" \
 && cd freebindfree \
 && make

RUN git clone "https://github.com/matrix-org/matrix-appservice-irc.git" app \
  && cd app \
  && git checkout 0.13.1

WORKDIR /app
RUN npm install

# App
FROM node:10-slim

RUN apt-get update \
 && apt-get install -y sipcalc iproute2 openssl --no-install-recommends \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir app

WORKDIR /app

COPY --from=builder /app/node_modules /app/node_modules
COPY --from=builder /app/app.js /app/
COPY --from=builder /app/lib /app/lib
COPY --from=builder /freebindfree/libfreebindfree.so /app/libfreebindfree.so
COPY start.sh /app/

EXPOSE 9995
VOLUME /config
VOLUME /data

ENV LD_PRELOAD /app/libfreebindfree.so

ENTRYPOINT ["/app/start.sh"]
