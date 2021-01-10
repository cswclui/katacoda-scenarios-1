## Objective
The objective of this lesson is to demonstrate how to create the User Defined Function (UDF) that will be used in the trigger that will forward data being added to the monolithic application to a custom `receiver` service that act a proxy for future external feature services.

## What You'll Be Doing

## Steps

**Step 1:** Update the Linux environment

`apt-get update`{{execute T3}}

**Step 2:** Install the database client

`apt-get install libmysqlclient-dev -y`{{execute T3}}

**Step 3:** Confirm the database client is installed

`find / -name mysql_config`{{execute T3}}

You'll get the following output:

`/usr/bin/mysql_config`

**Step 4:** Clone in the code for the HTTP User Defined Function that provides HTTP capabilties to a trigger which we'll create in the upcoming lesson.

`cd ~/`{{execute T3}}

`git clone https://github.com/RebirthLee/mysql_udf_http_golang.git udf`{{execute T3}}

`cd udf`{{execute T3}}

**Step 5:** Build the User Defined Function 

`bash ./build.sh`{{execute T3}}

**WARNING:** You will get the following error message:

`./build.sh: line 1: mysql: command not found`

This is OK, it's an operational shortcoming that will not affect the integrity of the custom UDF.

**Step 6:** Copy the custom HTTP UDF into the database container's file system

`cp /root/udf/http.so ~/fortune-cookies/monolith_v2/data/.`{{execute T3}}

---

***Next: Forwarding data using the UDF in a database trigger*** 