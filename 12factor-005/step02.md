## Objective
The objective of this lesson is to install the [Jenkins](https://www.jenkins.io/) into the Katacoda interactive learning environment.

Jenkins is a well known open source platform for continuous integration and continuous delivery ([CI/CD](https://en.wikipedia.org/wiki/CI/CD)) activity. As mentioned previously, we'll use Jenkins to work with a script stored in the common GitHub code repository to automatically do the Build and Release stages of Build, Release, Run.

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute}}

You should see the following output:

`/root/12factor`

**Step 2:** Check out the `git` branch that contains the source code for this lesson:

`git checkout 5-build-release-run.0.0.1`{{execute}}

You'll see output as follows:

```
Branch '5-build-release-run.0.0.1' set up to track remote branch '5-build-release-run.0.0.1' from 'origin'.
Switched to a new branch '5-build-release-run.0.0.1'

```

We're now ready to install Jenkins. As mentioned earlier, we're going to run Jenkins in a Docker container created especially for this scenario.

**Step 3:** Go back to the `HOME` directory

`cd ~/`{{execute}}

**Step 4:** Get the special Jenkins Docker code from GitHub

`git clone https://github.com/reselbob/fatjenkins.git`{{execute}}

**Step 5:** Go the Jenkin's source code working directory

`cd fatjenkins`{{execute}}

**Step 6:** Build the Docker image for Jenkins

`docker build -t fatjenkins:v1 .`{{execute}}

**Step 7:** Create the Jenkins container from the Docker image

`docker run --name jenkins --network="host" -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker fatjenkins:v1`{{execute}}

You'll get output similar to the following:

`6b96fc158571c67dc3d8c151f0914a0a10c408f6f61b8c82dc86b81f3a75e666`

**Step 8:**  Click the link below to go to the instance of Jenkins running in Katacoda.

**Beware!** It takes the container running Jenkins a while to spin up. Sometimes it can take a minute or two. So,  you might have to click the link below a few times to get the Jenkins site to load.

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com


## Summary

In this lesson you got Jenkins up and running as Docker container. In the next lesson we're going to create a Jenkins Pipeline job that will run a `Jenkinsfile` script stored in the GitHub repository along with the application source code. The `Jenkinsfile` script contains the instructions to get the source code for the demonstration application, *Secret Society* from GitHub, build it into a container image and then store that container image on the Local Container Registry that was installed behind the scenes in the Katacoda interactive learning environment.

----
***Next: Setting up the Automated Jenkins Pipeline to Build and Release Code***