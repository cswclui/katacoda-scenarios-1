## Objective
The objective of this lesson is to install the source code for the demonstration application, *Food Court*, convert each process in the source code into a container image, store that image in a Local Container Registyr and then get the demonstration application up and running under Docker Compose.

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute}}

You should see the following output:

`/root/12factor`

**Step 2:** Check out the `git` branch that contains the source code for this lesson:

`git checkout 6-processes.0.0.1`{{execute}}

You'll see output as follows:

```
Branch '6-processes.0.0.1' set up to track remote branch '6-processes.0.0.1' from 'origin'.
Switched to a new branch '6-processes.0.0.1'

```

Install the stateless processes as a collection of Docker containers running under [Docker Compose](https://docs.docker.com/compose/).

**Step 3:** Execute the bash script that executes the provisioning

`sh docker-seed.sh`{{execute}}

sh docker-seed.sh

**Step 4:** Confirm that the expected the docker images in the Local Container Registry

`curl http://localhost:5000/v2/_catalog`{{execute}}

You should see the following as output:

`{"repositories":["burgerqueen","customer","hobos","iowafried"]}`

**Step 5:** In a second terminal window, start the application using Docker Compose under the Docker network named, `westfield_mall`.

`cd ~/12factor && docker-compose up`{{execute T2}}


---

***Next: Understanding the nature of stateless processes***