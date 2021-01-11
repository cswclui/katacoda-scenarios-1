![logo](mstran-006/assets/logo-sm.png)

## Objective

The objective of the secenario is to demonstrate how to initiate the tranformation of a monolithic to a microservice using the [Strangler Pattern](https://docs.microsoft.com/en-us/azure/architecture/patterns/strangler-fig).

## What You'll Be Doing 

The scenario implements a version of the Strangler Pattern that we'll call Strangler Lite. Strangler Lite augments the code in the `sender` component of *Fortune Cookies* so that *sent Fortune* that have been sent internally from within the monolith are emitted from the application to an independent, external MariaDB database. 

![Fortune Cookies Components](mstran-007/assets/basic-architecture-components.png)

Once the data is in the MariaDB database, that data is accessible to any interested service.

The project is deployed as Docker containers aggregated under [Docker Compose](https://docs.docker.com/compose/).


You'll be doing the following steps:

* **Step 1:** Installing the lesson code
* **Step 2:** Getting the code up and running
* **Step 3:** Exercising the Code
* **Step 4:** Analyzing the code

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](mstran-007/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.