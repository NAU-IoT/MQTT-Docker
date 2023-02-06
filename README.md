# MQTT-Docker
Contains the files and configurations necessary for running MQTT in a Ubuntu container.

Currently, this MQTT broker is configured to communicate over port 31883 for insecure MQTT. This basic Docker image is meant to be used as a reference for any containerized applications that may need to communicate over MQTT.

## Build Instructions
First, clone this repo to your workstation and enter the MQTT-Docker/ directory:
```bash
git clone https://github.com/NAU-IoT/MQTT-Docker.git
cd MQTT-Docker
```

Build the docker image (be sure to include the trailing '.'):
```bash
docker build --rm -t mqtt-docker .
```

Run the docker image:
```bash
docker run -p 31883:31883 -t -i -d mqtt-docker
```
- Notice the `-p` flag. This binds port `31883` of the container to port `31883` of the host machine. To see another example of this, refer to the Docker run documentation here: https://docs.docker.com/engine/reference/commandline/run/#publish

At this point, you should have a running Ubuntu container with a working instance of MQTT installed on it. Verify that you have a running mqtt-docker container with:
```bash
docker ps
```

