## Objective
The objective of this lesson is analyze how ports are assigned ti services in the demonstration application.

As mentioned previously, port configuration is done in the `docker-compose.yaml` file. Let's open the file and take a look at the contents.

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute T1}}

You should see the following output:

`/root/12factor`

**Step 2:** Open the `docker-compose.yaml` source code in `vi`.

`vi docker-compose.yaml`{{execute T1}}

**Step 3:** Turn on line numbering in the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

and then enter:

`:set number`{{execute T1}}

The port settings in *Food Court* for the `customer` service are declared at `Lines 6 - 7`. The environment variable `APP_PORT` declares the port that the `customer` web server will listen for incoming requests. The environment variable `RESTAURANT_PORT` declares the port to where `customer` will a send HTTP request to restaurant.

The DNS names for the services are defined in the comma delimted string that is assigned to the environment variable, `RESTAURANT_DNS_NAMES` at `Line 8`. Thus, if `customer` wants to send a request to the *Burger Queen* service URL is:

`http://burgerqueen:3001`

The service names in the comma delimted string that's assigned to the environment variable,`RESTAURANT_DNS_NAMES` correspond to the service names defined for the Docker Compose configuration at `Lines 13, 19 and 25.` (The technique for service name definition is part of the way Docker Compose works.)

Also, you can see that each of the resturants services have an environment variable, `APP_PORT` which is assigned the value `3001`. This means that the web server's in each of the restaurant services will be listening for incoming request on port `3001`.


**Step 4:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 5:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

## Summary

The key concept of the 12 Factor App principle of Port Binding is that no matter what, the port number is the way that the service represents itself to the network and the internals of the service repect the port number. The service does not hard code DNS names.

DNS naming is done by the run time environment. This is why we had to inject the DNS names of the restaurants into the `customer` in the demonstration application, *Food Court*.

A pattern has emerged over the years in which certain well known products and services will publish default port numbers that become conventional. For example [MySQL](https://dev.mysql.com/) default to port to `3306`. [MongoDB's](https://docs.mongodb.com/manual/reference/default-mongodb-port/) default port is `27017`. Web servers run by default on port `80`. And, secure web servers running under `HTTPS` run on port `443`. Also, the SSH servers listen on port `22`.

---

**Congratuations!** You've completed the scenario.