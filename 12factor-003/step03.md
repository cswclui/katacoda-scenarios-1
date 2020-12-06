## Objective
The objective of this lesson is to demonstrate how use and manage enternal configurations over multiple versions in order to make an applications flexible, scalable and easier to change.

In this lab we're going to compare two version of the lab's demonstration application to learn how control configuration changes across multiple versions.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

If the working directory is not `/root/12factor`, execute the following command:

`cd /root/12factor`{{execute T1}}

**Step 2:** We're going to checkout another, later version of the demonstration application, *Pinger* . But, first we need to delete the existing directory, `node_modules` because the next version will have its own set of dependencies that need to downloaded and used at run time.

`clear && rm -rf node_modules`{{execute T1}}

**Step 3:** Check out a new version of the demonstration application from the local repository that you cloned down from GitHub at the start of this lesson.

`git checkout 3-config.0.0.1`{{execute T1}}

You'll see output as follows:

```
Branch '3-config.0.0.1' set up to track remote branch '3-config.0.0.1' from 'origin'.
Switched to a new branch '3-config.0.0.1'
```

**Step 4:** Let's take a look at the configuration settings in the `.env` file.

`cat .env`{{execute T1}}

You'll get the following output:

```
PINGER_PORT=3040
PINGER_ADMIN=true
CURRENT_VERSION="3-config.0.0.1"
```

Notice we've changed the port to which the webserver will listen for incoming requets. In the prior version as `3030`. Now, with the new configuration, the port is `3040`.

Notice too, that there a new environment variables in the `.env`. These environment variables are special to the demonstration application. They're meaning is as follows:

* `PINGER_PORT` defines the port where the application's webserver will be listening
* `PINGER_ADMIN` is a flag that when set to `true` will make it so that *Pinger* will return details about the enviornment in which it is running.
* `CURRENT_VERSION` describes the current version of the of *Pinger*

**Step 5:** Install the dependencies

`npm install`{{execute T1}}

**Step 6:** Start the demonstration application webserver in a second terminal window:

`cd /root/12factor && node server.js`{{execute T2}}

You'll get the following output:

`API Server is listening on port 3040`

**Step 7:** Make a `curl` call to the application in the first terminal window:

`curl http://localhost:3040`{{execute T1}}


Notice that now, we are getting a lot more information in the response and the configuration settings are affecting how the application behaves.

**Step 8:** Shut down the web server in preparation for next lesson

`echo "Web server as been shut down"`{{execute interrupt T2}}

---

In the next lesson we're going shut down the webserver and change the `PINGER_ADMIN` to `false` in order to change the application's behavior.

***Next: Changing Behavior by Changing Config Settings***


