# Running Kafka Using Docker Compose

Must has `JRE` and `keytool` installed to Kafka keystores and trust stores. See `kafka-ssl/README.md`.

## How to run in Plaintext mode

Run command

```sh
make up MODE=plaintext-single
```

## How to run in SSL mode

- Make sure `kafka-ssl/kafka-generate-ssl-automatic.sh` is executable.

```sh
chmod +x kafka-ssl/kafka-generate-ssl-automatic.sh
```

- Create new file `secrets/credentials`. This is use for storing password.

- Generate key stores and trust stores. Make sure you Use same password in `secrets/credentials`.

```sh
COUNTRY=<COUNTRY> STATE=<STATE> OU=<OU> LOCATION=<LOCATION> PASSWORD=<PASSWORD> ./kafka-generate-ssl-automatic.sh
```

- Move all generated files to folder `secrets`.

- Create `config/producer.properties`.

```sh
cp config/producer.properties.example config/producer.properties`
```

- Replace the password with the one you save in `secrets/credentials`.

- Run Kafka

```sh
make up MODE=ssl-single
```

## Docker compose examples

- [Single node, Plaintext](https://github.com/apache/kafka/blob/trunk/docker/examples/docker-compose-files/single-node/plaintext/docker-compose.yml)
- [Single node, SSL mode](https://github.com/apache/kafka/blob/trunk/docker/examples/docker-compose-files/single-node/ssl/docker-compose.yml)

## Sources

- [DigitalOcean: How to Secure and Monitor Kafka](https://www.digitalocean.com/community/developer-center/how-to-secure-and-monitor-kafka)
