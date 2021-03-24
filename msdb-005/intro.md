![logo](msdb-005/assets/logo-sm.png)

## Objective

The objective of the secenario is to demonstrate the basic structure and implementation of the Saga Pattern for coordinating distributed transactions.

## What You'll Be Doing 

The scenario implements a simple Choreography-based Saga Pattern to coordinate a sequence of distributed transactions as may be done by a simple online store.
An order microservice receives an order via an HTTP requests and then updates its local database of orders and sends a notification to a payment microservice.
The payment microservice updates an account database and then sends a notification to a stock microservice which updates shipping and inventory data in its own
local database.  Each of the microservices can be queried via HTTP to see their local database data.  If an error occurs at any point in the process the overall
transaction is aborted and messages are sent along the reverse path to trigger the previous steps to be rolled back as well.

![Choreography-based Saga](msdb-005/assets/choreography-saga.png)


The project is deployed as Docker containers aggregated under [Docker Compose](https://docs.docker.com/compose/).


You'll be doing the following steps:

* **Step 1:** Installing the lesson code
* **Step 2:** Getting the code up and running
* **Step 3:** Exercising the Code
* **Step 4:** Analyzing the code

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](msdb-005/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.