## Objective

The objective of this lab is to demonstrate the basic concepts behind of the third of 12 Factor App principles, **[Config](https://12factor.net/config)**.

## What is Config?

According to the website, [12 Factor App](https://12factor.net/config), Config is about storing configuration data in the environment.

*"Apps sometimes store config as constants in the code. This is a violation of twelve-factor, which requires strict separation of config from code. Config varies substantially across deploys, code does not.*

*A litmus test for whether an app has all config correctly factored out of the code is whether the codebase could be made open source at any moment, without compromising any credentials.*

*...this definition of 'config' does not include internal application config, such as `config/routes.rb` in Rails, or how code modules are connected in Spring. This type of config does not vary between deploys, and so is best done in the code."*

## What you'll be doing 

In this lab you'll doing following:

* **Step 1:** Cloning the Lesson Code from GitHub
* **Step 2:** Understanding the Benefit of an Independent Config
* **Step 3:** Managing Independent Config Across Versions
* **Step 4:** Changing Application Behavior Using Config Settings

## Executing command line instructions 

This scenario is completely interactive. The instructions you'll be given will be executed directly in the terminal window that is embedded directly in the Katacoda interactive learning environment. In the steps to come, when you see a command line instruction with a black background and check mark at the end, like so:

![Katacoda command line](12factor-002/assets/command-01.png)

just click on it and the command will execute in the interative terminal window.

## About the demonstration application

This lab uses a demonstration application named, *Pinger*. The purpose of *Pinger* is to report environmental information of a webserver at runtime. We'll be adding features to *Pinger* throughout the labs in order to demonstrate the principles of 12 Factor App. In order to control developement, a new branch will be created in this project's GitHub repository each time a feature set is created.

---

Click the START SCENARIO button to start.
