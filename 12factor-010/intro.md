![logo](12factor-001/assets/logo-sm.png)

## Objective

The objective of this lab is to demonstrate the basic concepts behind of the tenth of 12 Factor App principles, **[Dev/prod parity](https://12factor.net/dev-prod-parity)**.

## What is Dev/Prod Parity?

According to the website, [12 Factor App](https://12factor.net/dev-prod-parity), 

*The twelve-factor app is designed for continuous deployment by keeping the gap between development and production small. Looking at the three gaps described above:*

* *Make the time gap small: a developer may write code and have it deployed hours or even just minutes later.*
* *Make the personnel gap small: developers who wrote code are closely involved in deploying it and watching its behavior in production.*
* *Make the tools gap small: keep development and production as similar as possible.*

In other words, Dev/Prod Parity is about making sure the deployment paths among releases are identical and any differences that do exists are in configuration settings for `build,` `release` and target environments for the `run` phases.

## What you'll be doing 

In this scenario you'll be working with principle of Dev/prod parity](https://12factor.net/dev-prod-parity) to by installing an instance of Jenkins directly in the Katacoda interactive learning environment and then configure Jenkins to deploy two versions of the screnario's demonstration application, *Secret Society*.

Version 1 of *Secret Society* is a simple web application that emits an HTTP response in JSON that has the name of secret agent, a secret message and some meta data. 

Version 2 of *Secret Society*  has an added an added feature. The new feature is that the JSON will also report the region in which the secret agent operates.

![Katacoda command line](12factor-010/assets/dev-prod-parity.png)

When you look at the details of this scenario you'll discover that the deployment process for both versions is identical. Any difference that exists is in the configuration settings made in the associated `Jenkinsfile` and `docker-compose.yaml` files that are relevant to the given branch.

Keeping the deployment process identical among version releases and putting the routing information to the target runtime environment in a release specific set of configuration files is the key principle of [Dev/prod parity](https://12factor.net/dev-prod-parity).

You'll be doing the following steps:

* **Step 1:** Installing the Source Code
* **Step 2:** Installing Jenkins
* **Step 3:** Preparing for Multiple Releases
* **Step 4:** Implementing Dev-Prod Parity Under Jenkins

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](12factor-010/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.