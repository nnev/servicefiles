#!/bin/sh

case $1 in
generate)
  exec node app.js -r -f /config/appservice-registration-irc.yaml -c /config/config.yaml -u "http://localhost:9995"
  ;;
start)
  exec node app.js -c /config/config.yaml -p 9995 -f /config/appservice-registration-irc.yaml -u http://localhost:9995
  ;;
*)
  echo "Usage:\n\t $0 (generate | start)"
  ;;
esac
