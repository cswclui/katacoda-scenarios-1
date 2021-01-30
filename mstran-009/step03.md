## Objective
The objective of this scenario is install Glider Labs Registrator tool. You'll use Registrator  to register microservices with Consul***


## Steps

**Step 1:** Install the first service instance of `nginx` as a Docker container.

`docker run -d -p :80 -e "SERVICE_80_NAME=http" -e "SERVICE_80_ID=http1" -e "SERVICE_80_CHECK_HTTP=true" -e "SERVICE_80_CHECK_HTTP=/" --name=nginx1 nginx`{{execute}}

**Step 2:** Install the second service instance of `nginx` as a Docker container.

`docker run -d -p :80 -e "SERVICE_80_NAME=http" -e "SERVICE_80_ID=http2" -e "SERVICE_80_CHECK_HTTP=true" -e "SERVICE_80_CHECK_HTTP=/" --name=nginx2 nginx`{{execute}}

**Step 3:** Install the third service instance of `nginx` as a Docker container.

`docker run -d -p :80 -e "SERVICE_80_NAME=http" -e "SERVICE_80_ID=http3" -e "SERVICE_80_CHECK_HTTP=true" -e "SERVICE_80_CHECK_HTTP=/" --name=nginx3 nginx`{{execute}}

**Step 4:** Call the Consul server using `curl` to get a list of the services Consul is monitoring.

`curl $CONSUL_IP:8500/v1/catalog/services`{{execute}}

You'll get output similar to the following:

```
{
  "consul":[],
  "consul-server-8300":[],
  "consul-server-8301":["udp"],
  "consul-server-8302":["udp"],
  "consul-server-8400":[],
  "consul-server-8500":[],
  "consul-server-8600":["udp"],
  "http":[]
}
 
```

**Step 5:** Just to get a sense of how the Docker microservices correlate with the Consul server, take a look at the running containers using `docker ps -a`

`docker ps -a`{{execute}}

You'll get output similar to the following:

```
CONTAINER ID        IMAGE                           COMMAND                  CREATED             STATUS              PORTS                                                                                                              NAMES
cd32920117d7        nginx                           "/docker-entrypoint.…"   2 minutes ago       Up 2 minutes        0.0.0.0:32770->80/tcp                                                                                              nginx3
0e0a8dd52db7        nginx                           "/docker-entrypoint.…"   2 minutes ago       Up 2 minutes        0.0.0.0:32769->80/tcp                                                                                              nginx2
f2380819c6f0        nginx                           "/docker-entrypoint.…"   2 minutes ago       Up 2 minutes        0.0.0.0:32768->80/tcp                                                                                              nginx1
2e053a7dba9c        gliderlabs/registrator:latest   "/bin/registrator -i…"   2 minutes ago       Up 2 minutes                                                                                                                           registrator
62a2a9fb49a5        gliderlabs/consul-server        "/bin/consul agent -…"   3 minutes ago       Up 3 minutes        0.0.0.0:8400->8400/tcp, 8300-8302/tcp, 8600/tcp, 8301-8302/udp, 0.0.0.0:8500->8500/tcp, 172.17.0.39:53->8600/udp   c1

```

Notice the three microservices running as `nginx1`, `nginx2` and `nginx3`.

----

***Next: Querying the Consul server to determine the health of microservices running under Consul.***