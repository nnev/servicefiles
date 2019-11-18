# Matrix-Irc

## Setup
Build the Docker container:
```sh
docker build . -t matrix-irc
```
Create your config at `config/config.yaml` and create a `config/passkey.pem` with the following command:
```sh
openssl genpkey -out config/passkey.pem -outform PEM -algorithm RSA -pkeyopt rsa_keygen_bits:2048
```
Now you can generate your appservice config:
```sh
docker run -v $(pwd)/config:/config matrix-irc generate
```
This will generate an `appservice-registration-irc.yaml`. Put this file somewhere your synapse server can read it and point it to it.
```yaml
# homeserver.yaml
app_service_config_files: ["appservice-registration-irc.yaml"]
```

## Running

```sh
docker run -v $(pwd)/data:/data -v $(pwd)/config:/config -p 9995:9995 matrix-irc start
```
