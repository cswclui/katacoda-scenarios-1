![logo](mstran-003/assets/logo-sm.png)

## Objective

The objective of the secenario is to get an example of a synchronous version of the *Fortune Cookies* microservice oriented application (MOA) installed and up and running. Then, once running the added objective is to understand the structure and mechanics of the MOA. nature of the service.

![Architecture](mstran-003/assets/sync-architecture.png)

Remember, the purpose of *Fortune Cookies* is to send a random "fortune" at a given interval of time to `users` that are registered with the system. Each user gets a random fortune. Fortune sending activity is coordinated in CronJobs that are created and managed in `scheduler` service.

![Components](mstran-003/assets/basic-architecture-components.png)

## What you'll be doing 

In this scenario you'll get the demonstration MOA up and running as a Kubernetes clsuter container. Then, once the MOA is running, you'll request fortunes from *Fortune Cookies* microservices oriented application.

You'll be doing the following steps:

* **Step 1:** Installing the lesson code
* **Step 2:** Getting the code up and running
* **Step 3:** Exercising the Code
* **Step 4:** Understanding the Code as an Example of a Synchronous Microservice Oriented Application

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](mstran-003/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.