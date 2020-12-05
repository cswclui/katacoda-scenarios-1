## Objective
The objective of this lesson is demonstrate how to [TO BE PROVIDED]

## Key Concept: 12 Factor App - Configuration
A key concept in the third principle of 12 Factor App is configuration for the application is stored in along with the application in the common repository.

We're going to cover configuration in depth in upcoming labs, but for now the important thing to understand is that the configuration information for the lab's application is stored in the general codebase according to a version branch.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor-001`

**Step 2:** Confirm you are in correct GitHub Branch

`git branch`{{execute}}

You should see the following output:

`1-codebase.0.0.1`

**Step 3:** Also, let's look at the hidden configuration file. First, we'll confirm the file is there: 

`clear && ls -1Ap`{{execute}}

Notice the `.env` file in the list. This file holds configuration information that will be used by the application.

**Step 5:** Now, look at the contents

`cat .env`{{execute}}

You'll see the following:

`PINGER_PORT=3030`

This configuration seeting defines an environment variable, `PINGER_PORT` and assign the value `3030` to the variable. There is programming logic that is special to the application that reads the value of `PINGER_PORT` in order to determine the port that the application's web server will listen on for incoming requests.

---

***Next: Running the Unit Tests***