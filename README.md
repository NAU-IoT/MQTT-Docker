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

## Interfacing with MQTT-Docker
There are several ways to interact with the running instance of MQTT-Docker. Here's a few examples to validate that everything is working as intended.

To validate outgoing messaging, set up a `mosquitto_sub` on your workstation to listen on the appropriate port we have designated:
```bash
mosquitto_sub -t 'test/topic' -p 31883 -v
```

Then, in another terminal, run the following command:
```bash
docker exec -it <CONTAINER_ID> /bin/bash -c 'mosquitto_pub -t "test/topic" -m "Hello from inside the container" -p 31883'
```

You should see the published message show up on the subscriber terminal. To test incoming messaging, flip this experiment, making the `mosquitto_sub` run from within the container and publish from your workstation.

For additional inspection and debugging, you can remote into the docker container using the following command:
```bash
docker exec -it <CONTAINER_ID> /bin/bash
```

