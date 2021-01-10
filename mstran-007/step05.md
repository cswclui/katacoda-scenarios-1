## Objective
The objective of this lesson is demonstrate how to install the custom HTTP UDF in an database trigger that will forward data onto a custom `receiver` that is a proxy for future messaging activity for future external features that will be consumers to the monolith data.

## What You'll Be Doing

## Steps

**Step 1:** Find the name of the database container:

`docker ps -a`{{execute T3}}

You'll get output similar to the following

```
TBP

```


**Step 2:** Go into a command line terminal in the database container:

`docker exec -it monolith_v2_mariadb_1 bash`{{execute T3}}

**Step 3:** Go to the database's plugin directory:

`cd /usr/lib/mysql/plugin`{{execute T3}}

**Step 4:** Copy the custom UDF created in the last lesson from outside the container into the plugin directory:

`cp /var/lib/mysql/http.so .`{{execute T3}}

**Step 5:** Start the database client:

`mysql -u root -p`{{execute T3}}

`password`{{execute T3}}

**Step 6:** Go into the `fortune_cookies` database:

`use fortune_cookies`{{execute T3}}

**Step 7:** Create the individual user defined functions that will use the HTTP UDF.

`CREATE FUNCTION http_help RETURNS STRING SONAME 'http.so';`{{execute T3}}

`CREATE FUNCTION http_get RETURNS STRING SONAME 'http.so';`{{execute T3}}

`CREATE FUNCTION http_post RETURNS STRING SONAME 'http.so';`{{execute T3}}

**Step 8:** Confirm that the `http_get` udf works:

`SELECT http_get('http://receiver:3030/', '{"firstName":"Cool", "lastName":"McCool", "dob":"1979-01-27", "email":"cool.mccool@reallycool.com", "phone":"123-456-7890"}');`{{execute T3}}

You'll get output similar to the following:

```
+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| http_get('http://receiver:3030/', '{"firstName":"Cool", "lastName":"McCool", "dob":"1979-01-27", "email":"cool.mccool@reallycool.com", "phone":"123-456-7890"}') |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| {"Body":"{\"receivedMethod\":\"GET\",\"receivedBody\":{}}"}
                                                                                                     |
+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.034 sec)

```


---

***Next: Creating the trigger***