![logo](mstran-003/assets/logo-sm.png)

## Objective

The objective of the secenario is to get an example of an asynchronous version of the *Fortune Cookies* microservice oriented application (MOA) installed and up and running. Then, once running, the added objective is to understand the structure and mechanics of the MOA.

This asynchronous version of *Fortune Cookies* is based on the event-driven architecture pattern. In an event-driven architecture messages are published and consumed between microservices using a message broker. When a message is received a microservice will execute behavior special to the event described in the message. For example, when the `sender` microservice receives an `onFortunesMessageReceived` message, it will use that fortune in the message for its sending behavior.

![logo](mstran-004/assets/async-architecture.png)

The benefit of using messages is that the behavior is "fire and forget". Unlike an HTTP `request/response` interaction which is inherently blocking, one a message is sent onto the broker, no further response is expected or needed. The assumption in play is that interested parties will receive the message and process it in their own way, in their own time.

## What you'll be doing 

In this scenario you'll get the demonstration MOA up and running as a Kubernetes clsuter container. Then, once the MOA is running, you'll request fortunes from *Fortune Cookies* microservices oriented application.

You'll be doing the following steps:

* **Step 1:** Installing the lesson code
* **Step 2:** Getting the code up and running
* **Step 3:** Exercising the Code
* **Step 4:** Understanding the Code as an Example of an Asynchronous Microservice Oriented Application

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](mstran-003/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.