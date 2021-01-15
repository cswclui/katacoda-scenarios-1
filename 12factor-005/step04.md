## Objective
The objective of this lesson is execute the Run stage of the 12 Factor [Build, Release, Run](https://12factor.net/build-release-run) principle.

## What you'll be doing

In this lesson you are going to invoke the demonstration application, *Secret Society* as a Docker container. The Docker container will get the associated container image from the Local Container Repository located at `localhost:5000`.

As you might recall, in the previous lesson we did the work of configuring Jenkins to automatically get the source code for the lesson's GitHub respository using a `Jenkinsfile`. Jenkins took the course code and create a container image which it stored in the Local Container Repository.

In ths lesson, we'll use that container image.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

If the working directory is not `/root/12factor`, execute the following command:

`cd /root/12factor`{{execute T1}}

**Step 2:** Take a look at the contents of the file, `env.list`.

`clear && cat env.list`{{execute T1}}

You see the following output.

```
SECRET_SOCIETY_AGENT="Doctor Evil"

```
The output above defines the environment variable, `SECRET_SOCIETY_AGENT` that will be configured in the demonstration application's runtime environment under Docker.

**Step 3:** Start up the demonstration app adding the environment variable, `SECRET_SOCIETY_AGENT`, so as to support the third principle of 12 Factor App: Config. In this case will use the file `env.list` that ships with the source code. (Remember all configuration information should stored in the common repository and injected into the environment at run time.)

`docker run --name mysecretagent --env-file env.list -d -p 3060:3050 localhost:5000/secretagent:v1`{{execute T1}}

**Step 4:** Call the API

`curl http://localhost:3060`{{execute T1}}

You'll get output simiar to the following:

```
{
    "secretAgent": "Doctor Evil",
    "secretMessage": "et aliquam dicta consequatur at",
    "id": "0484ed02-498b-401b-8fa0-d03b949db2b3",
    "created": "2021-01-15T03:37:30.989Z"
}

```

## Summary

Getting the demonstration application up and running is the last stage of Build, Release, Run under 12 Factor App. You have successfully completed the fith principle of 12 Factor App, Build, Release, Run.

---

**Congratuations!** You've completed the lab.


