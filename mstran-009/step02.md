## Objective
The objective of this lesson is to demonstrate how to install Glider Lab's Registrator.

Registrator is a utility service that will register Docker containers with Consul as observable microservices when the given container is created. 


## Steps

**Step 1:**  Install Glider Lab's Registrator as a container.


`docker run -d --name=registrator --net=host --volume=/var/run/docker.sock:/tmp/docker.sock gliderlabs/registrator:latest -internal consul://localhost:8500`{{execute}}

Registrator is now installed and well register microservices that are created with Docker.

----

***Next: Installing the microservices***