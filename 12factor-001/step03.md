## Objective
The objective of this lesson is demonstrate how to view and install the external dependencies that the lab's application requires.

## Key Concept: 12 Factor App - Dependencies
A key concept in the second principle of 12 Factor App is that all independent code modules are listed as dependencies of the application and installed with the main application needs them at runtime, either for testing or general operation.

We're going to cover Dependencies in depth in upcoming labs, but for now the important thing to understand is that the lab's application has external dependencies and they will be installed now.

## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor-001`

**Step 2:** Confirm you are in correct GitHub Branch

`git branch`{{execute}}

You should see the following output:

`1-codebase.0.0.1`

**Step 3:** View the file, `package.json` which is this list of Node.Js dependencies the application requires.

`cat package.json`{{execute}}

---

The list of dependencies is shown in this snippet of JSON.


**Step 4:** Install the dependencies

`npm install`{{execute}}

***Next: Viewing the Application Code***