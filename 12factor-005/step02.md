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

**Step 8:**  Get the initial login ID that you'll need to access Jenkins

`docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword`{{execute}}

**BEWARE:!!!** Sometimes it takes the Jenkins container to spin up. You might have to try **Step 8** more than once.

You will see output similar, but not the same as the following:

`134dbef47a2540a791c08b0af7575e30`

**Make sure you save the output.** You are going to need that output to get into Jenkins the first time you access the website.

Jenkins is now up and running. You can access it by clicking this URL:

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com

When you go to the URL you'll be asked to enter the ID value you generated in **Step 8**. Once you get into the Jenkin website, follow the instructions to complete the Jenkins setup process. The following animated GIF will walk you through the process. **REMEMBER!!!! Make sure ID string outputted at the beginning of this step on hand.**

**Step 9:** Watch the following animated GIF to see the detail for initializing Jenkins:



**Hint:** Jenkins will as you which plugins you want to install during the intialization process. Select the option, **INSTALL SUGGESTED PLUGINS**.



## Summary

----


***Next: Setting up the Automated Jenkins Pipeline to Build and Release Code***