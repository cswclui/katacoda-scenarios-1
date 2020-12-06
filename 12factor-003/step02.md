## Objective
The objective of this lesson is to demonstrate how use and manage external configuration according to the [Config](https://12factor.net/config) principle of 12 Factor App in order to make an applications flexible, scalable and easier to change.

In this lab we're going to compare two version of the lab's demonstration application to learn how control application change using external configuration.

## Key Concept: 12 Factor App - Dependencies
A key concept in the **Config** principle of 12 Factor App is that all external configuration data is stored independent of your application. Typically configuration information is injected into the environment at runtime. The actual information is stored in manifest files that are associated with the application but indenpendent of it.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

**Step 2:** Check out the an earlier version of *Pinger* from the local `git` repo that we've just cloned from GitHub

`git checkout 2-dependencies.0.0.1`{{execute}}

You'll see output as follows:

```
Branch '1-codebase.0.0.1' set up to track remote branch '2-dependencies.0.0.1' from 'origin'.
Switched to a new branch '2-dependencies.0.0.1'

```
**Step 3:** Take a look at the contents of the demonstration application's working directory.

`clear && ls -1Ap`{{execute}}

You'll see output as follows:

```
.env
.git/
package.json
readme.md
server.js
test/

```

Notice the file `.env`. This file contains environment settings that will be loaded into memory at run time. (Using a `.env` file is a simple approach that Node.js programmers use to load in environment information at runtime. Using `.env` assumes that the NPM package, [`dotenv`](https://www.npmjs.com/package/dotenv) is listed in `package.json` as a dependency.) 

**Step 4:** Let's at the contents of `.env` file.

`cat .env`{{execute}}

You'll see output as follows:

`PINGER_PORT=3030`

The environment variable `PINGER_PORT` defines the port on which the application's webserver will listen for incoming requests. (**NOTE** Using `PINGER_PORT` is special to the demonstration application.)


**Step 4:** Install the demonstration application's dependencies.

`npm install`{{execute}}

You'll get the following output:

```
added 245 packages from 699 contributors and audited 245 packages in 5.274s

24 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
```

**Step 5:** Let's start the applications webserver is second terminal window:

`cd 12factor && node server.js`{{execute T2}}

You'll get the following output:

`API Server is listening on port 3030`

**Step 6:** In the first terminal window, let's send a request to the webserver and view the response.

`curl http://localhost:3030`{{execute T1}}


You'll get the following output:

```
{
    "appName": "Pinger",
    "currentTime": "2020-12-06T20:54:57.858Z",
    "PINGER_PORT": "3030",
    "randomMessage": "porro esse nesciunt qui doloribus",
    "correlationId": "ce4edf1b-6250-4665-be45-0e31a8780e06"
}

```

Notice that the webserver is listening on the [TCP/IP port](https://www.pcmag.com/encyclopedia/term/tcpip-port) 3030. The reason that the webserver is listening on port 3030 is because the application reads the value of the environment variable `PINGER_PORT` to runs on the port defined accordingly.

**Step 7:** Shut down the webserver running in the second terminal window.

`echo "Web server as been shut down"`{{execute interrupt T2}}



## Discussion

You can see in this lesson that the version of the demonstration application is determining which port to run the webserver on by reading from environmental variable, `PINGER_PORT`. This environment variable was injected at run time from the version's configuration file.

The important concept to understand is that we can associate configuration settings according to an application's version. And because the configuration settings are independent of the application they affect, we can alter them on a version by version basis. For example, we can change the port number of a web application without having to rewrite code. And, in some cases we can modify other behavior of the application by way of configuration changes.

Separating configuration setting from application code is an essential concept behind the **Config** principle of 12 Factor App.

---

In the next lesson we're going to checkout another version of the demonstration application from the common GitHub repository. This new version will run on a different port. Also, the new version will have additional application code that can be turned on and off according a configuration change.

The next lesson takes at look at how to manage configurations across multiple versions of an applicaton based on the **Config** principle of 12 Factor App.

***Next: Managing configurations across multiple versions***