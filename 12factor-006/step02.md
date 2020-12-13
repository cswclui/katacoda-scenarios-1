## Objective
The objective of this lesson is demonstrate how to [TO BE PROVIDED]

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


---

***Next: Understanding the nature of stateless processes***