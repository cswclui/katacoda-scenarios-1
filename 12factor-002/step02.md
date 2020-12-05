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
Switched to a new branch '1-codebase.0.0.1'

```

**Step 3:** Let's take a look at the dependencies list in `package.json` using the `jq` tool that's been installed into the Katacoda virtual machine automatically.

`jq .dependencies package.json`{{execute}}

You'll see output as follows:

```
{
  "dotenv": "^8.2.0",
  "uuid": "^3.3.3"
}
```

 Notice that this version has only two packages listed. These are the only packages that is version of the code requires.

**Step 4:** Check out the second,  version of *Pinger* from the local `git` repo that we've just cloned from GitHub

`git checkout 2-dependencies.0.0.1`{{execute}}

You'll see output as follows:

```
Branch '2-dependencies.0.0.1' set up to track remote branch '2-dependencies.0.0.1' from 'origin'.
Switched to a new branch '2-dependencies.0.0.1'

```

**Step 5:** Now let's take a look at the dependencies list in the second version of `package.json` using the `jq` tool.

`jq .dependencies package.json`{{execute}}

You'll see output as follows:

```
{
  "dotenv": "^8.2.0",
  "faker": "^5.1.0",
  "uuid": "^3.3.3"
}
```

Notice the difference? You'll see that the added package, `"faker": "^5.1.0"` has been added. Why had this addition been made?

The reason is because `faker` is needed to support a new feature of *Pinger*. The new features returns a random message as part of the HTPP response whick we'll exammine in the next lab.

The important thing to understand now it the the Depenedencies principle of 12 Factor App states that all external dependencies should exist in separate artitfact repositories and downloaded at runtime. In this case, the default  artifact repository for Node.js applications is [npmjs.com](https://www.npmjs.com/).

The immediate benefit is that the application code for *Pinger* contains only the logic that is absolutely necessary to support its features. Extraneous logic resides in external dependencies. This allows the application to be upgraded without having to accommodate a lot of unnecessary code. Also, using well defined external libraries means that an application can avoid the problem of [dependency hell](https://en.wikipedia.org/wiki/Dependency_hell).

---

The next lesson take sa look at how the external dependency supports the new feature implemented in *Pinger*.

***Next: Examining the new feature, `randomMessage`***