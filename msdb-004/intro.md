![logo](12factor-001/assets/logo-sm.png)

## Objective
The objective of this scenario is to analyze and demonstrate a example microservice that implements an event-driven approach to implementing the Command Query Responsibility Segregation (CQRS) pattern.

## What you'll be doing 

Part of this design implementation is to introduce a component in the form of a TypeScript class named, `Mediator`. The `Mediator` does the work of coordinating the works of adding new data to both the `write` and `read` data sources. The `Mediator` will add data to the `write` datasource directly. Then, the `Mediator` will publish a message to the message broker which is part of the this version of the `Order` microservice. The message will have data that is associated with an event named, `OnNewOrder`. The `read` data source is subscribed to the message broker to receive `OnNewOrder` messages.

When the component managing the `read` data source receives an `OnNewOrder` message it adds the data in that message to the `read` data source.


![Event Driven Architecture](msdb-004/assets/CQRS-basic-mediator.png)

The benefit of taking an even-driven approach to adding data to the `read` data source is that the process is loosely coupled. The activities of the `read` data source is completely separate from all other activity. Also, the `read` activity is asynchronous. This means that new data will be added to the `read` data source independently, without blocking activity in the parent microservice.


You'll be doing the following steps:

* **Step 1:** Installing the lesson code
* **Step 2:** Getting the code up and running
* **Step 3:** Analyzing the application
* **Step 4:** Viewing the Actual Data

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](msdb-004/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.