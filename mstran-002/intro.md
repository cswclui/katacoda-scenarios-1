![logo](mstran-002/assets/logo-sm.png)

## Objective

The objective of the secenario is to get an example of a monolithic service installed, up and running and to understand the monolithic nature of the service.

## About the Demonstration Project

The demonstration project for this lesson is a monolithic application named, *Fortune Cookies*. *Fortune Cookies*. The purpose of *Fortune Cookies* is to send a random "fortune" at a given interval of time to `users` that are registered with the system  

![logo](mstran-002/assets/basic-architecture-components.png)

The work of sending a fortune is faciliated by a [CronJob](https://en.wikipedia.org/wiki/Cron) that is dedicated to each `user`. The CronJob for the given `user` executes the send fortune behavior partiular to the `user.`

An array of CronJobs is created when the system intializes. When a new user is added to the system, a new CronJob for that user is added to array of CronJobs active in memory.

## What you'll be doing 

In this scenario you'll get the demonstration service up and running as a Docker container. Then, once the service is running, you'll add a new user to the service.

You'll be doing the following steps:

* **Step 1:** Installing the lesson code
* **Step 2:** Getting the code up and running
* **Step 3:** Exercising the Code
* **Step 4:** Understanding the Code as an Example of a Monolithic Service

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](mstran-002/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.