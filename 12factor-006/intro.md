![logo](12factor-001/assets/logo-sm.png)
## Objective

The objective of this lab is to demonstrate the basic concepts behind of the sixth of 12 Factor App principles, **[Processes](https://12factor.net/processes)**.

## What is Processes?

The Processes principle that states that a service or application must run in distinct, stateless process. State is held an ancillary process according the 12 Factor principle of [Backing service]([Processes](https://12factor.net/backing-service)).

According to the website, [12 Factor App](https://12factor.net/build-release-run), 

* *Twelve-factor processes are stateless and share-nothing. Any data that needs to persist must be stored in a stateful backing service, typically a database.*
* *Some web systems rely on “sticky sessions” – that is, caching user session data in memory of the app’s process and expecting future requests from the same visitor to be routed to the same process. Sticky sessions are a violation of twelve-factor and should never be used or relied upon. Session state data is a good candidate for a datastore that offers time-expiration, such as Memcached or Redis.*

## What you'll be doing 

In this scenario you'll be installing, analyzing and running a demonstration application named, *Food Court*. *Food Court* is a collection of Docker containers. Each container runs as a stateless process in compliance with the 12 Factor principle of Processes.


![Food Court](12factor-006/assets/foodcourt.jpg)

The steps you'll take in this scenario are as follows:

* **Step 1:** Cloning the Lesson Code from GitHub
* **Step 2:** Provisioning the Runtime Environment
* **Step 3:** Understanding the Nature of Stateless Processes
* **Step 4:** Running the Demonstration Application

## About the demonstration application

The demonstration application *Food Court* emulates a food court in a shopping mall. The food court is surrounded by three food counters, `Burger Queen`, `Hobos` and `Iowa Fried`.

Each restaurant has its own distinct menu. Thus, when a customer in the food court buys an item from a restaurant, the customer is getting an item that is special the menu of the given restaurant.

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](12factor-006/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.