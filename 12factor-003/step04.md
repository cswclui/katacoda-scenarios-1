## Objective
The objective of this lesson is to demonstrate how change the demonstration application's behavior by changing configuration settings.

In the previous lesson we checked out a newer version of the *Pinger* demonstration application and looked at the impact of those changes.

In this lesson we're going change the existing configuration settings and then observe a directly a change in application behavior due to the changes made.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

If the working directory is not `/root/12factor`, execute the following command:

`cd /root/12factor`{{execute T1}}

We're going change the configuration of the environment variables by deleting the existing `.env` file and replacing with the a different values. Changing the contents of `.env` file effectively changes the environment variables.

**Step 3:** Delete the `.env` file.

`rm -rf .env`{{execute T1}}

**Step 4:** Replenish the `.env` file with new values.

```
cat > .env<< EOF
PINGER_PORT=3040
PINGER_ADMIN=false
CURRENT_VERSION="3-config.0.0.1"
EOF
```{{execute}}

**Step 5:** Let's take a look at the configuration settings in the `.env` file.

`cat .env`{{execute T1}}

You'll get the following output:

```
PINGER_PORT=3040
PINGER_ADMIN=false
CURRENT_VERSION="3-config.0.0.1
```
Notice we've changed the `PINGER_ADMIN` to `false`. This change will restrict the content of the response coming from the webserver.

**Step 6:** Start the demonstration application webserver in a second terminal window:

`cd 12factor && node server.js`{{execute T2}}

You'll get the following output:

HERE

**Step 7:** Make a `curl` call to the application in the first terminal window:

`curl http://localhost:3040`{{execute T1}}


Notice that now, we are getting less information in the response and the configuration settings are affecting how the application behaves.

## Discussion

The important concept to understand in this lesson is that by separating configuration settings from application code as prescribed by 12 Factor App, we get a great deal of flexibility in terms of defining how an application will operate at runtime. Separating configuration settings from application code makes it so we can apply the core logic of application to a variety of runtime environments. Also, controlling configuration settings indepedent of the application makes continuous integration and continuous deployment (CI/CD) easier when moving an application through the various stages of release.

---

**Congratuations!** You've complete the lab




