## Objective
The objective of this lesson is to see a demonstraton of how to prepare a Build, Release, Run environment under Jenkins.

All the source code for *Collector* in directory, `./12factor/collector`. Well examine the files in this directory during our analysis.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

If the working directory is not `/root/12factor`, execute the following command:

`cd /root/12factor`{{execute T1}}

**Step 2:** Start up the demonstration app adding the environment variable, `SECRET_SOCIETY_AGENT`, so as to support the third principle of 12 Factor App: Config. In this case will use the file `env.list` that ships with the source code. (Remember all configuration information should stored in the common repository and injected into the environment at run time.)

`docker run --name mysecretagent --env-file env.list -d -p 3060:3050 localhost:5000/secretagent:v1`{{execute T1}}

**Step 3:** Call the API

`curl http://localhost:3060`{{execute T1}}

## Summary


---

***Next: Implementing Build, Release, Run***


