## Objective
The objective of this lesson is build an understanding of the principle of [Dev-Prod Parity](https://12factor.net/dev-prod-parity) by looking that the script and configuration settings for the two versions of the demonstration application, *Secret Society*.

The second version of *Secret Society* has a new feature that will report some new data. However, except for the new data, the `build`, `run` and `release` processes for both versions of the demonstration application are nearly identical. The same process is used to get the code from source control, build it and then move it all the through the CI/CD process to a target runtime environment.

(You can go [here](https://www.jenkins.io/doc/book/pipeline/syntax/) to learn the structure of a pipeline script in Jenkins.)

## Steps

**Step 1:** Navigate back to the lesson's working directory.

`cd /root/12factor && pwd`{{execute}}

You should see the following output:

`/root/12factor`

Let's examine the Jenkinsfile script for the first pipeline job. 

First we, need to go to the GitHub branch for the first version of the demonstration application, *Secret Society*.

**Step 2:** Checkout the branch for the first version of *Secret Society*.

`git checkout 10-dev-prod-parity.0.0.1`{{execute}}

You'll get the following output:

```
Switched to branch '10-dev-prod-parity.0.0.1'
Your branch is up to date with 'origin/10-dev-prod-parity.0.0.1'.

```

**NOTE:** You can view the entire `Jenkinfile` for the `V1` of *Secret Society* [here](https://raw.githubusercontent.com/innovationinsoftware/12factor/10-dev-prod-parity.0.0.1/docker-compose.yaml).

Now, we'll open the `vi` editor to examine the contents of the `Jenkinsfile`.

**Step 3:** `vi Jenkinsfile`{{execute}}

**Step 4:** Turn on the line numbering features in `vi`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}}

and then enter:

`:set number`{{execute T1}}}

This Jeninsfile pipeline as five stages, `build service`, `test service`, `release service to container repo`, `provision target deployment` and `run service on deployment target`

**WHERE**

* `build service` clone the code from the branch on the GitHub repo that has `V1` of *Secret Society* and runs `npm install` to download the dependencies from the internet.
* `test service` runs the unit tests that ship with the source code
* `release service to container repo` builds a `docker` image of *Secret Society* and pushes it to the Local Container Registry running inside of the Katacoda interactive learning environment
* `provision target deployment` installs `docker-compose` which is the runtime provisioning tool for this scenario. (You'd use a provisioning tools such as [Ansible](https://www.ansible.com/) or [Vagrant](https://www.vagrantup.com/) in a "real world" setting.
* `run service on deployment target` executes `docker-compose up` to create the container relevant to the `V1` release of *Secret Society* and have it run on the docker network, `dev_network` at `port` 4000. (Here are the links to the relevant [`Dockerfile`](https://raw.githubusercontent.com/innovationinsoftware/12factor/10-dev-prod-parity.0.0.1/app/Dockerfile) and [`docker-compose.yaml`](https://raw.githubusercontent.com/innovationinsoftware/12factor/10-dev-prod-parity.0.0.1/docker-compose.yaml) files if you want to see the exact details.

`Lines 5 - 16` describe the stage `build service`.

`Lines 7 - 23` describe the stage `test service`.

Let's go down a bit in the file:

Press the ESC key: `^ESC`{{execute ctrl-seq}}

`34`{{execute}}

`Lines 24 - 32` are the code for the the `release service to container repo` stage. This is where the pipleine code builds the `docker` image and pushes it into the Local Container Repository at `Line 29`.

Let's go down a bit further in the file:

Press the ESC key: `^ESC`{{execute ctrl-seq}}

`51`{{execute}}

`Lines 34 - 39` is the stage, `provision target deployment` where `docker-compose` is installed in the pipeline environment for this Jenkins job.

`Lines 41 - 57` is the stage, `run service on deployment target` where the command `docker-compose up` is run. Running the command will make is it so that `docker-compose` creates a container for the docker image, `secretagent:v1` and runs it in a docker network named, `dev_network` as defined in the file, [`docker-compose.yaml`](vhttps://raw.githubusercontent.com/innovationinsoftware/12factor/10-dev-prod-parity.0.0.1/docker-compose.yaml) under the `port` 4000, which is exposed to the Jenkins pipeline script.

You'll notice the pipeline script calls `wget -O- http://localhost:4000` that at `Line 46`,

**The important thing to notice** that the only thing special in the `Jenkinfile` pipeline script is the information that is relevant to the `V1` release of *Secret Society*. For example, the call to the branch `10-dev-prod-parity.0.0.1` on GitHub at `Line 7` and building the `docker` image using the tag `secretagent:v1` at `Line 27`.

All the other code is part of the deployment logic.

Next, well look at the `Jenkinsfile` for `V2` of of *Secret Society*. You'll see that the only difference is the branch in GitHub from where the source code will be cloned and the tag name of the `docker` image the pipeline will build. All the other information that is special the release is in the [`docker-compose.yaml`](https://raw.githubusercontent.com/innovationinsoftware/12factor/10-dev-prod-parity.0.0.2/docker-compose.yaml) file. 


**Step 5:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 6:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

Let's compare what we've just examined in the first `Jenkinfile` to the the next version intended for release. We need to check out the second GitHub branch that has the source code fdor the Version 2 of *Secret Society*

**Step 7:** Checkout the branch for the second version of *Secret Society*.

`git checkout 10-dev-prod-parity.0.0.2`{{execute}}

You'll get the following output:

```
Switched to branch '10-dev-prod-parity.0.0.2'
Your branch is up to date with 'origin/10-dev-prod-parity.0.0.2'.

```

Now, we'll open the `vi` editor to examine the contents of the `Jenkinsfile`.


**Step 8:** `vi Jenkinsfile`{{execute}}

**Step 9:** Turn on the line numbering features in `vi`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}}

and then enter:

`:set number`{{execute T1}}}

Take a look around the `Jenkinsfile`. Notice that except for  navigating to  a different branch on GitHub and using a different `tag` when creating the `docker` image for the deployment, the pipeline script in the `Jenkinsfile` for `V2` is the same as the pipeline script in `V1`.

As mentioned above, keeping processes identical is a key concept of the principle of [Dev/Prod Parity](https://12factor.net/dev-prod-parity) in 12 Factor App.

**Step 10:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 11:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

## Summary

At this point you've seen how we've lined up both versions for *Secret Society* for a consistent, repeatable deployment under Jenkins. In the next lesson you're going to create the two [Jenkins pipeline jobs](https://www.jenkins.io/doc/book/pipeline) directly in the instance of Jenkins we've installed in the previous lesson. Then, you'll execute each job to release and run on a Docker network that is the special target for the deployment.

---

***Next: Implementing Dev-Prod Parity Under Jenkins***