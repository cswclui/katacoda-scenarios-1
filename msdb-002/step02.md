## Objective
The objective of this lesson is get the lab's source code up and running.

## Steps

**Step 1:** Confirm that you're in the lab's working directory

`cd ~/simplecqrs && pwd`{{execute T1}}

You'll get the following output:

`/root/simplecqrs`

**Step 2:** Install the applications dependencies

`npm install`{{execute T1}}

You'll get output similar to the following:

```
.
.
added 293 packages from 643 contributors and audited 294 packages in 13.9s

23 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

```

**Step 3:** Install the application's backing service which is a single relational database, MariaDB

`docker-compose up -d`{{execute T1}}

**Step 3:** Export the environment variable that declare the port on which the application is to run.

`export APP_PORT=9001`{{execute T1}}

**Step 4:** Start the application

`npm start`{{execute T1}}

You'll get the following output

`server is listening on 9001`

**Step 5:** In a second terminal window, seed the application with data

`cd simplecqrs && npm run seed`{{execute T2}}

**Step 6:** Click the following link to verify that the data seeding has been successful.

https://[[HOST_SUBDOMAIN]]-9001-[[KATACODA_HOST]].environments.katacoda.com/orders



---

***Next: TO BE PROVIDED***