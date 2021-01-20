## Objective
The objective of this lesson is to get the demonstration code up and running.

## What You'll Be Doing

In this lesson we're going to examine the source code of the Stangler Lite version of *Fortune Cookies* to see how the `sender` component is in the early stage of being "strangled". Also, you look the the source code for service `report_gen`. The service, `report_gen` is a simple HTTP REST API that has a single endpoint the returns *sent Fortunes* data in JSON format. 

## Steps

**Step 1:** In second terminal window go to the working directory with the course code of the Stangler Lite version of *Fortune Cookies*.

`clear && cd ~/fortune-cookies/monolith_strangled/ && pwd`{{execute T2}}

You'll see output as follows:

`fortune-cookies/monolith_strangled/`

**Step 2:** Get all the services that are part of this scenario up and running as Docker containers aggregated under [Docker Compose](https://docs.docker.com/compose/)

`docker-compose up`{{execute T2}}

You'll get a continuing stream of output similar to the following:

```
fortune_cookie_1  | Executing (default): INSERT INTO `SentFortunes` (`id`,`firstName`,`lastName`,`fortune`,`updatedAt`,`createdAt`) VALUES (?,?,?,?,?,?);
fortune_cookie_1  | Writing sentFortune [object Object] at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time)
fortune_cookie_1  | Executing (default): INSERT INTO `SentFortunes` (`id`,`firstName`,`lastName`,`fortune`,`updatedAt`,`createdAt`) VALUES (?,?,?,?,?,?);
fortune_cookie_1  | Wrote sentFortune [object Object] at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time) with SentFortune ID dc78023a-1ef7-4467-ac54-ea0218ab7dd7
fortune_cookie_1  | Wrote SentFortune [object Object] to datasource at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time)
fortune_cookie_1  | Wrote sentFortune [object Object] at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time) with SentFortune ID 48d8c652-243f-45c0-9557-0f13efa53d3f
fortune_cookie_1  | Wrote SentFortune [object Object] to datasource at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time)
fortune_cookie_1  | Wrote sentFortune [object Object] at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time) with SentFortune ID d6147236-8d33-44ae-b033-f1e591f9f0b2
fortune_cookie_1  | Wrote SentFortune [object Object] to datasource at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time)
fortune_cookie_1  | Wrote sentFortune [object Object] at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time) with SentFortune ID 13229ea3-c19b-4c76-bdd1-008d9b2cea07
fortune_cookie_1  | Wrote SentFortune [object Object] to datasource at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time)
fortune_cookie_1  | Wrote sentFortune [object Object] at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time) with SentFortune ID 5368deb5-8163-4125-a699-2f9a0b1bd162
fortune_cookie_1  | Wrote SentFortune [object Object] to datasource at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time)
fortune_cookie_1  | Wrote sentFortune [object Object] at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time) with SentFortune ID 4e5a1437-7370-4b7c-980b-a027c38b7c89
fortune_cookie_1  | Wrote SentFortune [object Object] to datasource at Mon Jan 11 2021 04:06:03 GMT+0000 (Coordinated Universal Time)
```

**Step 3:** Use the MariaDB administration tool that ships with the lesson to view the contents of the monolith data source. Click the following link:

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/


![Database Access](mstran-008/assets/db_access.png)

You'll notice the database `fortune_cookies`. This is the database in which the monolithic application is storing data.

**Step 6:** Enter the `fortune_cookies` database to view its tables.

![Database Components](mstran-008/assets/stranger-data-ui.png)

You'll notice row count in the table, `SentFortunes`. You can infer that the MariaDB is receiving data emitted from the `send` component.