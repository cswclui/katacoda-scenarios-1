## Objective
The objective of this lesson is to demonstrate how to clone the lab code from GitHub into the Innovation In Software interactive learning environment.

## Steps

**Step 1:** Get the code from GitHub:

`git clone https://github.com/innovationinsoftware/12factor.git`{{execute}}

**Step 2:** Navigate to the working directory of the code just cloned. This directory contains all the assets for the lab's demonstration application.

`cd 12factor`{{execute}}

You have cloned the code for this lab and have navigated to the working directory of the lab's demonstration application. 

**Step 3:** This lesson requires a running instance of Redis. So, we'll install it as a Docker container.

`sudo docker run --name innoredis -p 6379:6379 -d redis`{{execute}}

You'll see output similar to the following:

`TBD`

We'll do a fast check of Redis by going into the Redis container and executing a `ping` command against Redis which will prove the application is working.

**Step 4:** Go into the Redis container's command line

`sudo docker exec -it innoredis sh`{{execute}}

**Step 5:** Execute the `ping` command at the command line:

`ping`{{execute}}

You'll get the following output:

`PONG`

**Step 6:** Exit out the the container

`exit`{{execute}}

---

***Next: Understanding the Benefit of Backing Services Under 12 Factor App***