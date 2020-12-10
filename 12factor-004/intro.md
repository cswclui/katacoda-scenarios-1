## Objective

The objective of this lab is to demonstrate the basic concepts behind of the fourth of 12 Factor App principles, **[Backing Services](https://12factor.net/backing-services)**.

## What is a Backing Service?

According to the website, [12 Factor App](https://12factor.net/config), a backing service is any service that the web service or pallication consumes over the network as part of its normal operation.

*"Backing services like the database are traditionally managed by the same systems administrators who deploy the app’s runtime. In addition to these locally-managed services, the app may also have services provided and managed by third parties. Examples include SMTP services (such as [Postmark](https://postmarkapp.com/), metrics-gathering services (such as [New Relic](https://newrelic.com/) or [Loggly](https://www.loggly.com/)), binary asset services (such as [Amazon S3](https://aws.amazon.com/s3/)), and even API-accessible consumer services (such as [Twitter](https://twitter.com/), [Google Maps](https://www.google.com/maps), or [Last.fm](https://www.last.fm/)).*

*The code for a twelve-factor app makes no distinction between local and third party services. To the app, both are attached resources, accessed via a URL or other locator/credentials stored in the config. A deploy of the twelve-factor app should be able to swap out a local MySQL database with one managed by a third party (such as Amazon RDS) without any changes to the app’s code.*


## What you'll be doing 

In this lab you'll doing following:

* **Step 1:** Cloning the Lesson Code from GitHub
* **Step 2:** Understanding the Benefit of Using a Backing Service
* **Step 3:** Binding an Application to a Backing Service
* **Step 4:** Creating a Backing Service

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](12factor-002/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

## About the demonstration application

This lab uses a demonstration application named, *Pinger*. The purpose of *Pinger* is to report environmental information of a webserver at runtime. We'll be adding features to *Pinger* throughout the labs in order to demonstrate the principles of 12 Factor App. In order to control developement, a new branch will be created in this project's GitHub repository each time a feature set is created.

Also, new in this lesson we'll add an addition demonstration application named, *Collector*. *Collector* is a simple RESTful API that represents a backing service. *Collector* takes in data in JSON format via an HTTP POST. *Collector* will then store the data in a [Redis](https://redislabs.com/) database. The reasoning behind *Collector* will be discussed throughout the lesson.

---

Click the START SCENARIO button to start.
