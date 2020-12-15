## Objective
The objective of this lesson is demonstrate how to get the demonstration code up and running

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute}}

You should see the following output:

`/root/12factor`

**Step 2:** Check out the `git` branch that contains the source code for this lesson:

`git checkout 8-concurrency.0.0.1`{{execute}}

You'll see output as follows:

```
Branch '8-concurrency.0.0.1'
set up to track remote branch '8-concurrency.0.0.1' from 'origin'.
Switched to a new branch '8-concurrency.0.0.1'

```

Create the container images the scenario needs and store them in the Local Container Repository running on `localhost:5000`.

**Step 3:** Execute the bash script that executes the provisioning

`sh docker-seed.sh`{{execute}}

**Step 4:** Confirm that the expected the docker images in the Local Container Registry

`curl http://localhost:5000/v2/_catalog`{{execute T1}}

You should see the following as output:

```
TBD

```

---

***Next: Understanding the value of Port Binding***