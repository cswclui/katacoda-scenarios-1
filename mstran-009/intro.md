![logo](mstran-006/assets/logo-sm.png)


## Objective

The objective of this scenario is to get a basic understanding of Consul's health check feature

In this lab you will:

* Install a Consul server as a Docker container
* Install Registrator from Glider Labs to automatically register services with Consul
* Install three `nginx` servers and bind them to a single Consul service
* Query the Consul server for information about health of the 3 `nginx` servers when all are running and when some are running.

## What is Consul?

According to its manufacturer Hashicorp, [Consul](https://www.hashicorp.com/products/consul) is a single control plane for cloud networks. The technology provides:

* Centrally control the distributed data plane to provide a scalable and reliable service mesh
* Automate centralized network middleware configuration to avoid human intervention
* Provide a real-time directory of all running services to improve application inventory management
* Enable visibility into services and their health status to enhance health and performance monitoring
* Automate lifecycle management of certificates which can be issued by 3rd party Certificate Authority
* Provide unified support across a heterogeneous environment with different workload types and runtime platforms

In this scenario we're going to examine the service discovery and health check features of Consul.

## Contents

This scenarios is divided into the following steps.

* **Step 1** - Installing the Consul server
* **Step 2** - Install the Registrator
* **Step 3** - Installing the microservices
* **Step 4** - Querying the Consul server

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](mstran-009/assets/command.png)

just click on it and the command will execute in the interative terminal window.

Click the START SCENARIO button to start.