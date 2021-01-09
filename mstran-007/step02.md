## Objective
The objective of this lesson is to get the demonstration code up and running.

## What You'll Be Doing

```
TBD

```

## Steps

**Step 1:** Confirm the working directory for the monolithic applications.

`clear && cd ~/fortune-cookies/monolith_v2 && pwd`{{execute T1}}

You'll see output as follows:

`/root/fortune-cookies/monolith_v2`

**Step 2:** In a second termial window get the backing services up and running under Docker Compose

`cd ~/fortune-cookies/monolith_v2 && docker-compose up`{{execute T2}}

You'll get output similar to the following along with ongoing console output relevant the backing services' activities:

```
.
.
Creating monolith_v2_receiver_1 ... done
Creating monolith_v2_adminer_1  ... done
Creating monolith_v2_mariadb_1  ... done
.
.


```

**Step 3:** Go back to the first terminal window and install the application's external dependencies

`npm install`{{execute T1}}

You'll output similar to the following:

```
added 205 packages from 693 contributors and audited 205 packages in 4.925s

18 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

```

**Step 4:** Start the web server

`node server.js`{{execute T1}}

You'll get an ongoing stream of output from the monolithic app:


**Step 5:** Use the MariaDB administration tool that ships with the lesson to view the contents of the monolith data source. Click the following link:

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/


![Database Access](msdb-007/assets/db_access.png)

You'll notice the database `fortune_cookies`. This is the database in which the monolithic application is storing data.

![Database Components](msdb-007/assets/db_assets.png)

**Step 6:** Enter the `fortune_cookies` database to view its tables.

You'll notice that there are a large number of rows in the table, `SentFortunes`. This makes sense in that every time a `fortune` is sent, a write is made to the `SentFortunes` table.

For the purposes of demonstration, in lessons to come we're going to add a trigger to the database backing the monolith application. This trigger will forward the information in each `write` to the table, `SentFortunes` to an external `receiver` service via HTTP.

The purpose of `receiver` service is to act as a proxy to a message broker that will be brought online at a later time.

![Strangler Pattern](mstran-007/assets/strangler.png)

---

***Next: Understanding the use case and solution***