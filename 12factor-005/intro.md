## Objective

The objective of this lab is to demonstrate the basic concepts behind of the fifth of 12 Factor App principles, **[Build, Release, Run](https://12factor.net/build-release-run)**.

## What is a Build, Release, Run?

According to the website, [12 Factor App](https://12factor.net/build-release-run), Build, Release and Run are three distinct stages of deployment. 

*A codebase is transformed into a (non-development) deploy through three stages:*

* *The build stage is a transform which converts a code repo into an executable bundle known as a build. Using a version of the code at a commit specified by the deployment process, the build stage fetches vendors dependencies and compiles binaries and assets.*
* *The release stage takes the build produced by the build stage and combines it with the deploy’s current config. The resulting release contains both the build and the config and is ready for immediate execution in the execution environment.*
* *The run stage (also known as “runtime”) runs the app in the execution environment, by launching some set of the app’s processes against a selected release.*

![credit - 12factor.net](https://12factor.net/images/release.png)

## What you'll be doing 

In this lab we are going to use the [Multibanch Pipeline](https://www.jenkins.io/blog/2015/12/03/pipeline-as-code-with-multibranch-workflows-in-jenkins/) feature of Jenkins to run a Jenkin job automatically according to a `Jenkinsfile` that is stored in the GitHub branch for this scenario. (We'll examine the `Jenkinsfile` in detail as the lesson progresses.) The `Jenkinsfile` and the Jenkins job it describes is designed to touch on all the key conceptual points of Build, Release, Run.

The Jenkins job will clone the latest code for the demonstration project, *Secret Society* from the GitHub repository. As mentioned above, the source code ships with a `Jenkinsfile` which is a set of instructions that Jenkins will execute automagically.

The Jenkins job will get the source code for the demonstration project, install the dependencies and then run the unit tests on the code. The tests will pass.

Then, after testing the Jenkins job will create a [container image](https://www.docker.com/resources/what-container) according to the `Dockerfile` that also ships with the source code. The Jenkins job will then store the container image in a local container registry in the virtual machine for the Katacoda interactive learning environment.

![jenkins-container](12factor-005/assets/12-factor-5-intro.jpg)

As mentioned aboave, the Release stage needs to have a container registry available to store the container image that the automated Jenkins job will create. This instance of the Katacoda interactive learning enviroment has a container repository installed and running at `localhost:5000`.

When it comes time to do the Run stage, we'll use the container image stored in the local container repository to get the demonstration application up and running from the command line of the virtual machine for the Katacoda interactive learning environment.

The steps you'll take in this scenario are as follows:

* **Step 1:** Cloning the Lesson Code from GitHub
* **Step 2:** Installing Jenkins in Katacoda
* **Step 3:** Setting Up the Automated Jenkins Pipeline to Build and Release Code
* **Step 4:** Running the Demonstration Application Using the Local Container Registry

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](12factor-005/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

## About the demonstration application

There is a demonstration application that is used in this secnario. It is called *SecretSociety*. *SecretSociety* is an HTTP API that returns a JSON object when a `GET` request is made against the API root path. The JSON object has the following structure:

```
{
    "secretAgent": "James Bond",
    "secretMessage": "facere quia est aliquam doloremque",
    "id": "555da479-2d78-488d-9583-4c601f5da0a6",
    "created": "2020-12-11T01:04:37.562Z"
}

```

**WHERE**

* **`secretAgent`** is a property that reports the value of the evironment variable, `SECRET_SOCIETY_AGENT`. If a value is not assigned to `SECRET_SOCIETY_AGENT`, then the value `UNKNOWN` is returned.
*  **`secretMessage`** is a string generated at random by the application
*  **`id`** is UUID assigned by the application at runtime
*  **created** is the date when the object was created

We'll use this application to demonstrate concepts in this scenario as well as others that follow.

---

Click the START SCENARIO button to start.
