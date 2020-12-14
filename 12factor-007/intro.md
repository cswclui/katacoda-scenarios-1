## Objective

The objective of this lab is to demonstrate the basic concepts behind of the seventh of 12 Factor App principles, **[Port Binding](https://12factor.net/port-binding)**.

## What is Port Binding?

The Port Binding principle is that a web application or service should expose itself to the network as a port number. Any web server or other protocol that supports network traffic should be internal to the web application or service.

According to the website, [12 Factor App](https://12factor.net/port-binding), 

* *The twelve-factor app is completely self-contained and does not rely on runtime injection of a webserver into the execution environment to create a web-facing service. The web app exports HTTP as a service by binding to a port, and listening to requests coming in on that port.*
* *HTTP is not the only service that can be exported by port binding. Nearly any kind of server software can be run via a process binding to a port and awaiting incoming requests. Examples include ejabberd (speaking XMPP), and Redis (speaking the Redis protocol)*

## What you'll be doing 

In this lab we're going to revisit the demonstration application *Food Court* that we examined in the last lab about the principle of [Processes](https://12factor.net/processes). Only this time we're going to modify *Food Court* by changing the ports on which the constituent restaurant services run, thus demonstrating the benefit of the Port Binding principle. The way we are going ao manipluate port binding is by way of the third principle of 12 Factor App, [Configuration](https://12factor.net/config).

The code in this version of the *Food Court* application has been refactored to make it responsive to changes in the port bindings. All of this well be revealed as you do the lessons in the lab.

The steps you'll take in this scenario are as follows:

* **Step 1:** Installing the Source Code from GitHub
* **Step 2:** Getting the Code Up and Running
* **Step 3:** Learn the Value of Port Binding
* **Step 4:** Binding to Services by Port Number

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](12factor-007/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.