## Objective
The objective of this lesson is to demonstrate how to create the User Defined Function (UDF) that will be used in the trigger that will forward data being added to the monolithic application to a custom `receiver` service that act a proxy for future external feature services.

## What You'll Be Doing

## Steps

`apt-get update`{{execute T3}}

`apt-get install libmysqlclient-dev{{execute T3}}

`find / -name mysql_config`{{execute T3}}

`cd ~/`{{execute T3}}

`git clone https://github.com/RebirthLee/mysql_udf_http_golang.git udf`{{execute T3}}

`cd udf`{{execute T3}}

`bash ./build.sh`{{execute T3}}

`cp /root/udf/http.so ~/fortune-cookies/monolith_v2/data/.`{{execute T3}}

---

***Next: Forwarding data using the UDF in a database trigger*** 