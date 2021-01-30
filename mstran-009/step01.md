## Objective
The objective of this lesson is to install the [Consul](https://www.consul.io/) server as a Docker container.

## Steps

**Step 1:** Find the IP address of the virtual machine hosting the Katacoda interactive learning and assign it to the environment varaible, `MY_IP`.

`MY_IP="$(/sbin/ifconfig ens3 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')" ; echo $MY_IP`{{execute}}



**Step 2:** Install Consul as a Docker container using the following command:

`docker run -d --name=c1 -p 8500:8500 -p $MY_IP:53:8600/udp -p 8400:8400 gliderlabs/consul-server -node myconsul -bootstrap`{{execute}}


**Step 3:** Get the IP address of the container running the Consul server and save it to a Linux variable, `IP` using the following command:

`CONSUL_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' c1); echo $CONSUL_IP`{{execute}}

**Be advised:** The IP address of the Consul server will be different than the IP address of the Katacoda host.

**Step 4:** Query the Consul server for a list of known services:

`curl $CONSUL_IP:8500/v1/catalog/services`{{execute}}

You'll get output simiar to the following:

`{"consul":[]}`

This output makes sense because we have no microservices registered with the Consul server. We'll do this registration in the next steps.

----
***Next: Installing the Registrator tool to register microservices with Consul***