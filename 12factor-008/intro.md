## Objective

The objective of this lab is to demonstrate the basic concepts behind of the eighth of 12 Factor App principles, **[Concurrency](https://12factor.net/concurrency)**.

## What is Concurrency?

According to the website, [12 Factor App](https://12factor.net/concurrency), 

* *In the twelve-factor app, processes are a first class citizen. Processes in the twelve-factor app take strong cues from the unix process model for running service daemons. Using this model, the developer can architect their app to handle diverse workloads by assigning each type of work to a process type. For example, HTTP requests may be handled by a web process, and long-running background tasks handled by a worker process.*

## What you'll be doing 

In this scenario you''ll be working with a version of the *Food Court* application that has been refactored into a distributed application that runs in a Kubernetes Cluster. We're running *Food Court* under the [Kubernetes](https://kubernetes.io/docs/home/) container orchestration framework because it makes it possible to organzize the code components of *Food Court's* into Kubernetes [services](https://kubernetes.io/docs/concepts/services-networking/service/), [deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) and [pod](https://kubernetes.io/docs/concepts/workloads/pods/) resources. The resources are easy to manage declaratively under Kubernetes using resource files that define the particular configuration of the given resource.

In this lab we're going to demonstrate the 12 Factor App principle of Concurrency by scaling different portions of *Food Court* up according to the process type.

The steps you'll take in this scenario are as follows:

* **Step 1:** Installing the Source Code from GitHub
* **Step 2:** Getting the Code Up and Running in a Kubernetes
* **Step 3:** Learning About Process Concurrency According to Type
* **Step 4:** Affecting the Demonstration Application's Process Concurrency

## About the demonstration application
The demonstration application used in the scenario is a version of the *Food Court* project we've worked with previously. However, in this lab , *Food Court* has been refectored to run under a Kubernetes Cluster.

![Food Court](12factor-008/assets/foodcourt.jpg)

Each component is represented as a [Kubernetes Service](https://kubernetes.io/docs/concepts/services-networking/service/). Each service is backed by a [Kubernetes Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) of pods. You're going to affect concurrency by adjusting the `replicas` attribute in the manifest `yaml` file for some of the deployments.

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](12factor-008/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.