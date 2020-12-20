![logo](12factor-001/assets/logo-sm.png)
## Objective

The objective of this lab is to demonstrate the basic concepts behind of the nineth of 12 Factor App principles, **[Disposability](https://12factor.net/disposability)**.

## What is Disposability?

According to the website, [12 Factor App](https://12factor.net/disposability), 

* *Processes should strive to minimize startup time. Ideally, a process takes a few seconds from the time the launch command is executed until the process is up and ready to receive requests or jobs. Short startup time provides more agility for the release process and scaling up; and it aids robustness, because the process manager can more easily move processes to new physical machines when warranted.*
* *Processes shut down gracefully when they receive a SIGTERM signal from the process manager. For a web process, graceful shutdown is achieved by ceasing to listen on the service port (thereby refusing any new requests), allowing any current requests to finish, and then exiting. Implicit in this model is that HTTP requests are short (no more than a few seconds), or in the case of long polling, the client should seamlessly attempt to reconnect when the connection is lost.*

In other words, Disposability is about making sure that your web app or service starts and and shuts down in a safe efficient manner that is surprise free.

## What you'll be doing 

In this lab we're going to examine the shutdown code in the restaurant service, *Burger Queen* that is part of the *Food Court* web application.

You'll be doing the following steps:

* **Step 1:** Installing the Source Code from GitHub
* **Step 2:** Getting the Code Up and Running
* **Step 3:** Instigating Shutdown of a Service
* **Step 4:** Analyzing the Shutdown Code

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](12factor-009/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.