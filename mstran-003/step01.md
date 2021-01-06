## Objective
The objective of this lesson is demonstrate how to clone from GitHub the project code you'll be using in this lab.

## Steps

**Step 1:** Get the code from GitHub:

`git clone https://github.com/reselbob/fortune-cookies.git`{{execute T1}}

**Step 2:** Navigate to the working directory of the code just cloned. This directory contains all the assets for the lab's demonstration application.

`cd ~/fortune-cookies/microservice-sync && pwd`{{execute T1}}

You'll see output as follows:

`/root/fortune-cookies/microservice-sync`

**Step 3:** Check out the branch relevant to this lesson:

`git checkout expose_users_under_loadbalancer`{{execute T1}}

You'll get the following output:

```
Branch 'expose_users_under_loadbalancer' set up to track remote branch 'expose_users_under_loadbalancer' from 'origin'.
Switched to a new branch 'expose_users_under_loadbalancer'
```

---

***Next: Getting the code up and running***