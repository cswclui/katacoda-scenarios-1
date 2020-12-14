## Objective
The objective of this lesson is demonstrate how to get the demonstration code up and running

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute}}

You should see the following output:

`/root/12factor`

**Step 2:** Check out the `git` branch that contains the source code for this lesson:

`git checkout 7-port-binding.0.0.1`{{execute}}

You'll see output as follows:

```
Branch '7-port-binding.0.0.1'
set up to track remote branch '7-port-binding.0.0.1' from 'origin'.
Switched to a new branch '7-port-binding.0.0.1'

```

Install the stateless processes as a collection of Docker containers running under [Docker Compose](https://docs.docker.com/compose/).

**Step 3:** Execute the bash script that executes the provisioning

`sh docker-seed.sh`{{execute}}

**Step 4:** Confirm that the expected the docker images in the Local Container Registry

`curl http://localhost:5000/v2/_catalog`{{execute T1}}

You should see the following as output:

```
{"repositories":["burgerqueen","customer","hobos","iowafried"]}

```

**Step 5:** In a second terminal window, start the application using Docker Compose under the Docker network named, `westfield_mall`.

`cd ~/12factor && docker-compose up`{{execute T2}}

Notice the as the containers in *Food Court* come online under Docker Compose that the web service `customer` is running on port `3000` like so:

```
customer_1     | Friendly Shopper API Server is listening on port 3000

```

While the restaurant web services are running on port `3001`.

```
hobos_1        | Howard Bonsons API Server is started on 3001  at Sun Dec 13 2020 23:47:47 GMT+0000 (UTC) with pid6
iowafried_1    | Iowa Fried Chicken API Server is started on 3001  at Sun Dec 13 2020 23:47:46 GMT+0000 (UTC) withpid 6
burgerqueen_1  | Burger Queen API Server is started on 3001  at Sun Dec 13 2020 23:47:48 GMT+0000 (UTC) with pid 6

```
This is something to remember as we'll talk about port numbers more in upcoming lessons.

**Step 6:** Make 20 calls on the application using `curl`;

`for i in {1..20}; do curl localhost:4000 -w "\n"; done`{{execute T1}}

You'll get output similar to, but not exactly like the following:

```
{"restaurant":"Howard Bonsons","order":"grilled cheese","customer":"Friendly Shopper"}
{"restaurant":"Burger Queen","order":"fries","customer":"Friendly Shopper"}
{"restaurant":"Iowa Fried Chicken","order":"Chix Pack","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"grilled cheese","customer":"Friendly Shopper"}
{"restaurant":"Burger Queen","order":"burger","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"fried shrimp","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"fried shrimp","customer":"Friendly Shopper"}
{"restaurant":"Iowa Fried Chicken","order":"Spicy Wings","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"soda and fries","customer":"Friendly Shopper"}
{"restaurant":"Burger Queen","order":"whooper","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"double burger","customer":"Friendly Shopper"}
{"restaurant":"Iowa Fried Chicken","order":"Spicy Wings","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"grilled cheese","customer":"Friendly Shopper"}
{"restaurant":"Burger Queen","order":"whooper","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"grilled cheese","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"fried shrimp","customer":"Friendly Shopper"}
{"restaurant":"Burger Queen","order":"fries","customer":"Friendly Shopper"}
{"restaurant":"Burger Queen","order":"whooper","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"grilled cheese","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"fried shrimp","customer":"Friendly Shopper"}
```
As you see the application is up an running properly.


---

***Next: Understanding the value of Port Binding***