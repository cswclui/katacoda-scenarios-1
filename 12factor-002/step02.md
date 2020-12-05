## Objective
The objective of this lesson is to demonstrate how use and manage enternal dependencies in order to make an applications flexible, scalable and easier to change.

In this lab we're going to compare two version of the lab's demonstration application to learn how control application change using dependency mamagement.

## Key Concept: 12 Factor App - Dependencies
A key concept in the **Dependencies** principle of 12 Factor App is that all external modules, packages or libraries are stored independent of your application and are stored in an external artifact repository. You application will keep a list of of external dependencies and the development framework that you use to program your application will have the capability to download the required dependencies from the give artifact repoistory at runtime.

Under no circumstance should external dependencies be stored in the application's central respository.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

**Step 2:** Check out the first version of *Pinger* from the local `git` repo that we've just cloned from GitHub

`git checkout 1-codebase.0.0.1`{{execute}}

You'll see output as follows:

```
Branch '1-codebase.0.0.1' set up to track remote branch '1-codebase.0.0.1' from 'origin'.
Switch

```

**Step 3:** Let's take a look at the dependencies list in `package.json` using the `jq` tool that's been installed into the Katacoda virtual machine automatically.

`jq .dependencies package.json`{{execute}}

You'll see output as follows:

HERE

**Step 4:** Check out the second,  version of *Pinger* from the local `git` repo that we've just cloned from GitHub

`git checkout 2-dependencies.0.0.1`{{execute}}

You'll see output as follows:

```
Switched to branch '2-dependencies.0.0.1'
Your branch is up to date with 'origin/2-dependencies.0.0.1'.

```

**Step 5:** Now let's take a look at the dependencies list in the second version of `package.json` using the `jq` tool.

`jq .dependencies package.json`{{execute}}

You'll see output as follows:

HERE

Notice the difference? You'll see that the package, `"faker": "^5.1.0"` has been added. Why?

Because `faker` is needed to support a new feature of *Pinger*. The new features returns a random message as part of the HTPP response.

---

***Next: Examining the new feature, `randomMessage`***