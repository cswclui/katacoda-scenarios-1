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
**Step 3:** Take a look at the contents of the demonstration application's working directory.

`tree ./`{{execute}}

You'll see output as follows:

```
./
├── package.json
├── readme.md
├── server.js
└── test
    └── http-tests.js

1 directory, 4 files

```

Notice that are **no** dependencies installed. If there were, under Node.js you would see directory named, `node_modules`.

However, the list of dependencies that the demonstration application needs is defined in the file, `package.json`.

**Step 4:** Let's take a look at the dependencies list in `package.json` using the `jq` tool that's been installed into the Katacoda virtual machine automatically.

`jq .dependencies package.json`{{execute}}

You'll see output as follows:

```
{
  "dotenv": "^8.2.0",
  "uuid": "^3.3.3"
}
```

The snippet of JSON shown above is the list of dependencies that applications needs. The dependencies  are Node.js packages that are stored in the Node.js package repository, [NPM](https://www.npmjs.com/). You use the command set, `npm install` to have the Node.js development framework go out to the Internet and install the dependencies from NPM, which we'll do in the following step.

**Step 4:** Install the demonstration application's dependencies.

`npm install`{{execute}}

You'll get the following output:

```
added 245 packages from 699 contributors and audited 245 packages in 5.274s

24 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
```

**Step 5:** Review the contents after the dependencies have been installed:

`tree ./ -L 1`{{execute}}

You'll get the following output:

```
./
├── node_modules
├── package.json
├── package-lock.json
├── readme.md
├── server.js
└── test

```

Notice that now the directory, `node_modules` is installed in the demonstration application's working directory.

**Step 6:** Take a look at the contents of the directory `node_modules`.

`ls ./node_modules/`{{execute}}

Notice that not only are the packages for `donenv` and `uuid` installed, but so are all the dependency packages that are associated with those two packages.

Having to manage each of these dependency installations manually is an arduous task. Fortanately following the **Dependendencies** principle of 12 Factor app makes things a lot easier.

## Discussion

The important thing to understand is that the **Dependencies** principle of 12 Factor App states that all external dependencies should exist in separate artitfact repositories and downloaded at runtime. In this case, the default artifact repository for Node.js applications is [npmjs.com](https://www.npmjs.com/).

The immediate benefit is that the application code for *Pinger* contains only the logic that is absolutely necessary to support its features. Extraneous logic resides in external dependencies. This allows the application to be upgraded without having to accommodate a lot of unnecessary code. Also, using well defined external libraries means that an application can avoid the problem of [dependency hell](https://en.wikipedia.org/wiki/Dependency_hell).

---

The next lesson takes at look at how to manage dependencies across multiple versions of an applicaton based on the **Dependencies** principle of 12 Factor App.

***Next: Managing dependencies across multiple versions***