## Objective
The objective of this lesson is to get the demonstration code up and running.

## What You'll Be Doing

```
TBD

```

## Steps

**Step 1:** Confirm the working directory for the monolithic applications.

`clear && cd ~/fortune-cookies/monolith_strangled/ && pwd`{{execute T1}}

You'll see output as follows:

`fortune-cookies/monolith_strangled`

**Step 2:** In a second termial window get the backing services up and running under Docker Compose

`cd ~/fortune-cookies/monolith_strangled && docker-compose up`{{execute T2}}

You'll get output similar to the following along with ongoing console output relevant the backing services' activities:

```
.
.

TBP
.
.


```



**Step 3:** Use the MariaDB administration tool that ships with the lesson to view the contents of the monolith data source. Click the following link:

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/


![Database Access](mstran-007/assets/db_access.png)

You'll notice the database `fortune_cookies`. This is the database in which the monolithic application is storing data.

![Database Components](mstran-007/assets/db_assets.png)

**Step 6:** Enter the `fortune_cookies` database to view its tables.

You'll notice that there are a large number of rows in the table, `SentFortunes`. This makes sense in that every time a `fortune` is sent, a write is made to the `SentFortunes` table.


---

***Next: Understanding the use case and solution***