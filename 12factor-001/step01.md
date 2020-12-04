## Objective
The objective of this lesson is demonstrate how to [TO BE PROVIDED]

## Steps

**Step 1:** Get the code from GitHub:

`git clone https://github.com/innovationinsoftware/12factor.git`{{execute}}

**Step 2:** Navigate to the code just cloned

`cd 12factor`{{execute}}

**Step 3:** Checkout the branch from the local GitHub code for this scenario

`git checkout 1-codebase.0.0.1`{{execute}}

**Step 4:** List the file

`tree ./`{{execute}}

**Step 5:** Also, let's look at the hidden configuration file. First, we'll confirm the file is there: 

`clear && ls -1Ap`{{execute}}

Notice the `.env` file in the list. This file holds configuration information that will be used by the application.

**Step 6:** Now, look at the contents

`cat .env`{{execute}}

You'll see the following:

```
PINGER_PORT=3030
```

---

***Next: TO BE PROVIDED***