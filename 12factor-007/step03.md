## Objective
The objective of this lesson is analyze the source code and configuration files to discover how these element comply with the 12 Factor App principle of [Port Binding](https://12factor.net/port-binding).

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute T1}}

You should see the following output:

`/root/12factor`

**Step 2:** Take a look at the `customer` source code in `vi`.

`vi ./customer/index.js`{{execute T1}}}

**Step 3:** Turn on line numbering in the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}}

and then enter:

`:set number`{{execute T1}}}

The `customer` web service has two purposes. The first purpose is to allow access to it by allowing those outside the Docker network named, `westfield_all` to make an HTTP request on the application hostname and port that's exposed publically. The second purpose of `customer` is to contact a constituent restaurant at random to get an order. These restaurants are accessible internally on the Docker network `westfield_all`. The hostname of each restaurant is the service name under which the restaurant runs as defined in the `docker-compose.yaml` file.

Let's do a short analysis of code.

Notice that `Line 2` defines the port on which the `customer` web server will be listening. The port value is assigned either from the environment variable, `APP_PORT`. If `APP_PORT` does not exist, the default value, `3000` is assigned.

Line 3 is the port where `customer` will make an HTTP request to contact any constiuent restaurant. The port of the restaurants is defined by the environmental variable, `RESTAURANT_PORT`.

The assumption is that all restaurants will be running on the same port. This is not a problem because each restaurant will be running under its own DNS host name the gets assigned automatically by Docker Compose. As mentioned above, the host name corresponds to the service under which the restaurant is defined in `docker-compose.yaml`. (We going to look at a port assigment and service name definition in `docker-compose.yaml` in the next lesson.

**The important thing** to understand is that each service in *Food Court* is completely self-sustaining. No web server is injected nor is any DNS host name known directly. DNS names are assigned at run time by the Docker Compose domain name server. All any of the web services really know is its port number. This the essential concept behind the principle of Port Binding. **Apps and services are exposed via a port number.**

Let's get out of `vi` and take a look at some code for a restaurant.

![portbinding](12factor-007/assets/portbinding.jpg)

**Step 4:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 5:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

Let's take a look at the code for the constituent restaurant service `burgerqueen`/

**Step 6:** Take a look at the source code for the restaurant `burgerqueen` in `vi`.

`vi ./burgerqueen/index.js`{{execute T1}}}

**Step 7:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}}

and then enter:

`:set number`{{execute T1}}}

Notice `Line 2` in the `burgerqueen` code:

```
const port = process.env.APP_PORT || 3000;

```
 `Line 2` is where the restaurant service, in this case `burgerqueen` get the port on which it will run. As with the other service it looks to get its value from the environment variable, `APP_PORT`. If the environment variable does not exists, it uses the default port, `3000`. That the `customer` and the restaurant services, `burgerqueen`, `hobos` and `iowafried` are all using the same environment variable name is permisssible because each of these services will run in a container. Thus, each container will have its own instance of the environment variable.
 
The important thing is this: as with `customer` each restaurant service is self-contained and each restaurant service presents itself via its port number.

**Step 8:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step y:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

---

***Next: Binding to services by port number***