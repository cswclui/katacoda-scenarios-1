## Objective
The objective of this lesson is to demonstrate how to clone the lab code from GitHub into the Innovation In Software interactive learning environment on Katacoda and then switch to the Git branch for this scenario.

## Steps

**Step 1:** Get the code from GitHub:

`cd ~/ && git clone https://github.com/innovationinsoftware/12factor.git`{{execute T1}}

**Step 2:** Navigate to the working directory of the code just cloned. This directory contains all the assets for the lab's demonstration application.

`cd ~/12factor && pwd`{{execute T1}}

**Step 3:** Check out the `git` branch that contains the source code for this lesson:

`git checkout 9-disposability.0.0.1`{{execute T1}}

You'll see output as follows:

```
Branch '9-disposability.0.0.1'
set up to track remote branch '9-disposability.0.0.1 from 'origin'.
Switched to a new branch '9-disposability.0.0.1'

```

---

***Next: Getting the code up and running***