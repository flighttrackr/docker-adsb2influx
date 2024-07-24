# Base
FROM alpine:3.20.2 AS base

# Packages
RUN apk add --no-cache \
    python3 py3-pip ca-certificates


# Builder
FROM base AS builder

# Workdir
WORKDIR /app

# Packages
COPY requirements.txt .

RUN mkdir python-packages && \
    pip install --no-cache-dir --prefix=/app/python-packages -r requirements.txt


# Release
FROM base AS release

# Workdir
WORKDIR /app

# Copy files
COPY --from=builder /app/python-packages /usr
COPY adsb2influx.py .

# Permissions
RUN chmod +x adsb2influx.py

# Environment
ENV SBS_HOST="localhost" \
    SBS_PORT="30003" \
    INFLUX_URL="" \
    INFLUX_TOKEN="" \
    INFLUX_ORG="" \
    INFLUX_BUCKET="adsb" \
    INFLUX_MEASUREMENT="messages" \
    SEND_INTERVAL="60"

# Command
CMD [ "sh", "-c", "python3 adsb2influx.py -sh $SBS_HOST -sp $SBS_PORT -iu $INFLUX_URL -it $INFLUX_TOKEN -io $INFLUX_ORG -ib $INFLUX_BUCKET -im $INFLUX_MEASUREMENT -si $SEND_INTERVAL" ]
