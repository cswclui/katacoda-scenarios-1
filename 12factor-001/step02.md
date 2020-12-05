## Objective
The objective of this lesson is inspect the various files in the lab's codebase in order to get a sense of how all assets the make up the application are stored in the common repository and versioned according to GitHub branches.

## Key Concept: 12 Factor App - Codebase
A key concept in the first principle of 12 Factor App is that all the assets of an application are stored in a common source code repository. Assets include not only the code logic that makes up the application, but all configuration information relevant to a given version, a list of dependencies that the main application requires as well as any tests that are to be run against the application.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor-001`

**Step 2:** Checkout the code from the GitHub branch for the version of the application code for this lab, in the case `1-codebase.0.0.1`.

`git checkout 1-codebase.0.0.1`{{execute}}

**Step 3:** View the files in the branch:

`tree ./`{{execute}}

You'll see output as follows:


**WHERE**

`files here`

**Step 4:** Also, there a hidden file name, `.env` that contains environmental configuration setting that the applicatoin will use. Let's confirm the file is there: 

`clear && ls -1Ap`{{execute}}

You'll see output as follows:

Notice the `.env` file in the list. This file holds configuration information that will be used by the application. We'll demonstrated different aspect of configuration as they apply to 12 Factor App throughout the labs. The important thing to know for now that in 12 Factor App configuration information is stored in the common repository according to the version of the code to which the configuration applies.

---

***Next: Installing Dependecies***