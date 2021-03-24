## Objective
The objective of this lesson is to get the demonstration code up and running.

## What You'll Be Doing

In this lesson you're going to upgrade the version of docker-compose on the lab machine, then you'll run a script to build Docker container images for all the microservices,
then you'll run docker compose to start-up all the containers as per configuration int he docker-compose.yml file

## Steps

**Step 1:** First you'll run the `upgrade-docker-compose.sh` script to upgrade the version of docker compose on the lab machine

`./upgrade-docker-compose.sh`{{execute T1}}

You'll see output as follows:

```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   633  100   633    0     0  10550      0 --:--:-- --:--:-- --:--:-- 10550
100 11.6M  100 11.6M    0     0  26.7M      0 --:--:-- --:--:-- --:--:-- 58.0M
```

**Step 2:** Build the Docker container images for the microservices in the lab via the `docker-seed.sh` script.

`./docker-seed.sh`{{execute T1}}

You'll see output similar to the following:

```
.
.
added 56 packages, and audited 57 packages in 2s

found 0 vulnerabilities
npm notice 
npm notice New minor version of npm available! 7.6.3 -> 7.7.3
npm notice Changelog: <https://github.com/npm/cli/releases/tag/v7.7.3>
npm notice Run `npm install -g npm@7.7.3` to update!
npm notice 
Removing intermediate container 381bc65b4fbb
 ---> 135923daa802
Step 5/5 : CMD node index.js
 ---> Running in 8711ffcc21f2
Removing intermediate container 8711ffcc21f2
 ---> 9e78b5f40cad
Successfully built 9e78b5f40cad
Successfully tagged payment:latest
Sending build context to Docker daemon  22.53kB
Step 1/5 : FROM node
 ---> 4d032a7b0ca9
Step 2/5 : WORKDIR /app
 ---> Using cache
 ---> 259334a5af54
Step 3/5 : COPY . /app
 ---> 48652200b22f
Step 4/5 : RUN npm install
 ---> Running in 4781c1670479

added 56 packages, and audited 57 packages in 2s

found 0 vulnerabilities
npm notice 
npm notice New minor version of npm available! 7.6.3 -> 7.7.3
npm notice Changelog: <https://github.com/npm/cli/releases/tag/v7.7.3>
npm notice Run `npm install -g npm@7.7.3` to update!
npm notice 
Removing intermediate container 4781c1670479
 ---> 7e155ea8199e
Step 5/5 : CMD node index.js
 ---> Running in a83b6f75ac94
Removing intermediate container a83b6f75ac94
 ---> dc2d886c33a9
Successfully built dc2d886c33a9
Successfully tagged stock:latest
```

**Step 3:** Get all the services that are part of this scenario up and running as Docker containers aggregated under [Docker Compose](https://docs.docker.com/compose/)

`docker-compose up`{{execute T1}}

You'll get a continuing stream of output similar to the following:

```
redis_1    | 1:C 24 Mar 2021 20:50:02.314 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
redis_1    | 1:C 24 Mar 2021 20:50:02.314 # Redis version=6.0.9, bits=64, commit=00000000, modified=0, pid=1, just started
redis_1    | 1:C 24 Mar 2021 20:50:02.314 # Configuration loaded
redis_1    | 1:M 24 Mar 2021 20:50:02.316 * Running mode=standalone, port=6379.
redis_1    | 1:M 24 Mar 2021 20:50:02.316 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
redis_1    | 1:M 24 Mar 2021 20:50:02.316 # Server initialized
redis_1    | 1:M 24 Mar 2021 20:50:02.316 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
redis_1    | 1:M 24 Mar 2021 20:50:02.316 * Ready to accept connections
stock_1    | Subscriber be55b324-9ec0-4527-93c0-9fed0672c26e is attached to channel,[StockService] at Wed Mar 24 2021 20:50:03 GMT+0000 (Coordinated Universal Time) in stock service
stock_1    | Publisher 1a74b4b1-a936-4dc0-a54a-5c8a76c0b483 is attached to channel,[PaymentService] at Wed Mar 24 2021 20:50:03 GMT+0000 (Coordinated Universal Time) in stock service
stock_1    | stock service listening at http://localhost:8082
stock_1    | Subscriber be55b324-9ec0-4527-93c0-9fed0672c26e READY at Wed Mar 24 2021 20:50:03 GMT+0000 (Coordinated Universal Time)
stock_1    | Subscriber be55b324-9ec0-4527-93c0-9fed0672c26e SUBSCRIBING to Channel StockService at Wed Mar 24 2021 20:50:03 GMT+0000 (Coordinated Universal Time)
stock_1    | Subscriber be55b324-9ec0-4527-93c0-9fed0672c26e SUBSCRIBED to Channel StockService at Wed Mar 24 2021 20:50:03 GMT+0000 (Coordinated Universal Time)
order_1    | Subscriber 225f4e25-3005-4f21-8388-ae1a0263aa72 is attached to channel,[OrderService] at Wed Mar 24 2021 20:50:04 GMT+0000 (Coordinated Universal Time) in order service
order_1    | Publisher f5c3038a-1f8f-45bc-b4c8-c719150631b4 is attached to channel,[PaymentService] at Wed Mar 24 2021 20:50:04 GMT+0000 (Coordinated Universal Time) in order service
order_1    | order service listening at http://localhost:8080
order_1    | Subscriber 225f4e25-3005-4f21-8388-ae1a0263aa72 READY at Wed Mar 24 2021 20:50:04 GMT+0000 (Coordinated Universal Time)
order_1    | Subscriber 225f4e25-3005-4f21-8388-ae1a0263aa72 SUBSCRIBING to Channel OrderService at Wed Mar 24 2021 20:50:04 GMT+0000 (Coordinated Universal Time)
order_1    | Subscriber 225f4e25-3005-4f21-8388-ae1a0263aa72 SUBSCRIBED to Channel OrderService at Wed Mar 24 2021 20:50:04 GMT+0000 (Coordinated Universal Time)
```