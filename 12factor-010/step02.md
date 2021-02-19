## Objective
The objective of this lesson is to install the [Jenkins](https://www.jenkins.io/) into the Katacoda interactive learning environment.

Jenkins is a well known open source platform for continuous integration and continuous delivery ([CI/CD](https://en.wikipedia.org/wiki/CI/CD)) activity. As mentioned previously, we'll use Jenkins to work with a script stored in the common GitHub code repository to automatically do the Build and Release stages of Build, Release, Run.

## Steps

**Step 1:** Confirm you're in the lesson's working directory.

`cd /root/12factor && pwd`{{execute}}

You should see the following output:

`/root/12factor`

We're now ready to install Jenkins. As mentioned earlier, we're going to run Jenkins in a Docker container created especially for this scenario.

**Step 2:** Go back to the `HOME` directory

`cd ~/`{{execute}}

**Step 3:** Get the special Jenkins Docker code from GitHub

`git clone https://github.com/reselbob/fatjenkins.git`{{execute}}

**Step 5:** Go the Jenkin's source code working directory

`cd fatjenkins`{{execute}}

**Step 6:** Build the Docker image for Jenkins

`docker build -t fatjenkins:v1 .`{{execute}}

**Step 7:** Create the Jenkins container from the Docker image

`docker run --name jenkins --network="host" -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker fatjenkins:v1`{{execute}}

**Step 8:**  Click the link below to go to the instance of Jenkins running in Katacoda.

**Beware!** It takes the container running Jenkins a while to spin up. Sometimes it can take a minute or two. So,  you might have to click the link below a few times to get the Jenkins site to load.

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com

## Summary

In this lesson you got Jenkins up and running as a Docker container. In the next lesson we're going to create two Jenkins Pipeline jobs. Each job will run a `Jenkinsfile` script that's stored in the GitHub repository that correlates to the two versions of *Secret Society* that we're going to release according to the 12 Factor App principle of [Dev/Prod Parity](https://12factor.net/dev-prod-parity). Each `Jenkinsfile` script contains the instructions to clone the source code for the relevant version of the demonstration application, *Secret Society*. Also, the script will build that code into a container image. The image is then stored in the Local Container Registry according to a tag for the particular version. (The Local Container Registry was installed behind the scenes in the Katacoda interactive learning environment at the start of the scenario.

----


**Next: Preparing for the Pipeline Scripts for Multiple Releases**