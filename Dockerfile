FROM ubuntu:latest

# Add apt repository for mosquitto
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && apt-add-repository ppa:mosquitto-dev/mosquitto-ppa

# Install mosquitto
RUN apt-get update \
    && apt-get install -y mosquitto mosquitto-clients

# Copy mosquitto configuration file
COPY mosquitto.conf /etc/mosquitto/

# Start the mosquitto service
CMD service mosquitto start \
    && bash

