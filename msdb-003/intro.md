![logo](12factor-001/assets/logo-sm.png)

## Objective

The objective of this scenario is to implement and analyze a simple example of the  [Command Query Responsibility Segregation](https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs) pattern.

## What you'll be doing 

In this scenario you'll work with a demonstration microservice that allows users to save and view `orders`.



In this scencario `order` management will be separated into two data sources. One data source will accept and store `write` data. The other data source will store and publish `read` data. Separating `write` from `read` acivity is the essential concept driving the CQRS pattern.

![Basic CQRS](msdb-003/assets/CQRS-basic.png)

The `order` described above serves as a input data into the microservce. However, as we examine the microservice, we'll find that there is not only the `order` described above, but also another `order` structure that is used internally in the microservice. This disparity between the two `order` structures is an example of the issue of defining data structures according to context boundary. (We'll look at this issue when we analyze the microservice.) 


In this scenario you'll be doing the following steps:

* **Step 1:** Installing the lesson code
* **Step 2:** Getting the code up and running
* **Step 3:** Analyzing the application
* **Step 4:** Identifying opportunities for improvement

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](msdb-003/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.