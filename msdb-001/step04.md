## Objective
The objective of this lesson is demonstrate how to package an API up into a transportable microservice running as a Docker Container.

## Steps

**Step 1:** confirm you're in the microservice's working directory.

`cd ~/simplemicroservice`{{execute}}

`clear && pwd`{{execute}}

You get the following output:

`/root/simplemicroservice`

**Step 2:** Build a Docker image of the *Fortunes* microservice

`docker build -t fortunes .`{{execute}}

**Step 3:** Create a Docker container that uses the Docker image created in the previous step.

`docker run -d -p 3003:3000 --name fortunes_service fortunes`{{execute}}

We now have the *Fortunes* microservice running in a Docker container. Let's exercies it

**Step 4:** Make a call on the *Fortunes* microservice that is exposed the host network via `port` `3001` as declared in the option `-p 3003:3000` of the `docker run` command executed in the previous step.

`curl localhost:3003`{{execute}}

You get output similar to the following:

{"fortune":"Windows will never cease."}

## Summary

The microservice is now transportable. The Docker image we created in Step 2 can be pushed to a `public` or `private` Container Registry such as [Docker Hub](https://hub.docker.com/). Once a container image it is avaiable to be used in any environment that supports running containers. This is possible because everything the microservice needs is packaged in the container image. Hence, the essential principles are supported. As we described at the beginning of this lab, microservice...

* **has a single responsility**
* **is discrete**
* **carries its own data**
* **is transportable**
* **is ephemeral**

---

**Congratuations!** You've completed the lab.