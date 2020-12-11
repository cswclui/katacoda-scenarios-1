## Objective

The objective of this lab is to demonstrate the basic concepts behind of the fifth of 12 Factor App principles, **[Build, Release, Run](https://12factor.net/build-release-run)**.

## What is a Build, Release, Run?

According to the website, [12 Factor App](https://12factor.net/build-release-run), a backing service is any service that the web service or pallication consumes over the network as part of its normal operation.

*"...".*


## What you'll be doing 

In this lab you'll doing following:

* **Step 1:** Cloning the Lesson Code from GitHub
* **Step 2:** Installing Jenkins in Katacoda
* **Step 3:** Understanding the Benefit of Build, Release, Run
* **Step 4:** Peparing a Build, Release, Run environment under Jenkins
* **Step 5:** Implementing Build, Release, Run

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](12factor-002/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

## About the demonstration application

There is a demonstration application that is used in this secnario. It is called *SecretSociety*. *SecretSociety* is an HTTP API that returns a JSON object when a `GET` request is made against the API root path. The JSON object has the following structure:

```
{
    "secretAgent": "James Bond",
    "secretMessage": "facere quia est aliquam doloremque",
    "id": "555da479-2d78-488d-9583-4c601f5da0a6",
    "created": "2020-12-11T01:04:37.562Z"
}

```

**WHERE**

* **`secretAgent`** is a property that reports the value of the evironment variable, `SECRET_SOCIETY_AGENT`. If a value is not assigned to `SECRET_SOCIETY_AGENT`, then the value `UNKNOWN` is returned.
*  **`secretMessage`** is a string generated at random by the application
*  **`id`** is UUID assigned by the application at runtime
*  **created** is the date when the object was created

We'll use this application to demonstrate concepts in this scenario as well as others that follow.

---

Click the START SCENARIO button to start.
