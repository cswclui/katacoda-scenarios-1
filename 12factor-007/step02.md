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

**Step 4:** Confirm that the expecxted the docker images in the Local Container Registry

`curl http://localhost:5000/v2/_catalog`{{execute T1}}

You should see the following as output:

```
{"repositories":["burgerqueen","customer","hobos","iowafried"]}

```

**Step 5:** In a second terminal window, start the application using Docker Compose under the Docker network named, `westfield_mall`.

`cd ~/12factor && docker-compose up`{{execute T2}}

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

---

***Next: Understanding the value of Port Binding***