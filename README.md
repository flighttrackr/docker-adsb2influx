# adsb2influx

[![Release](https://github.com/flighttrackr/docker-adsb2influx/actions/workflows/release.yml/badge.svg)](https://github.com/flighttrackr/docker-adsb2influx/actions/workflows/release.yml)

This project makes a fork from [slintak]'s [adsb2influx] software available as a Docker image.

Due to the API limitations of Docker Hub, we use GitHub as container image registry.

## Other projects

We have other Flighttracking projects, check our [GitHub profile].

## Supported architectures

- linux/amd64
- linux/arm/v6
- linux/arm/v7
- linux/arm64
- linux/386

## Run container

```shell
docker run \
  -it --rm \
  ghcr.io/flighttrackr/adsb2influx:latest
```

## Environment variables

| Environment variable | Default | Description |
| :- | :- | :- |
| SBS_HOST | localhost | SBS BaseStation Host |
| SBS_PORT | 30003 | SBS BaseStation Port |
| INFLUX_URL | | InfluxDB URL |
| INFLUX_TOKEN | | InfluxDB API token |
| INFLUX_ORG | | InfluxDB organisation |
| INFLUX_BUCKET | adsb | InfluxDB bucket |
| INFLUX_MEASUREMENT | messages | InfluxDB measurement |
| SEND_INTERVAL | 60 | Data send interval (sec) |


[slintak]: https://github.com/slintak
[adsb2influx]: https://github.com/slintak/adsb2influx
[GitHub profile]: https://github.com/flighttrackr
