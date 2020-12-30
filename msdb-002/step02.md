## Objective
The objective of this lesson is get the lab's source code up and running, seed the application with dagta and then check to make sure that the data seeding was successful.

## Steps

**Step 1:** Confirm that you're in the lab's working directory

`cd ~/simplecqrs && pwd`{{execute T1}}

You'll get the following output:

`/root/simplecqrs`

**Step 2:** Install the application's dependencies

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

**Step 3:** Export the environment variable that declares the port on which the application is to run.

`export APP_PORT=9001`{{execute T1}}

**Step 4:** Start the application

`npm start`{{execute T1}}

You'll get the following output

`server is listening on 9001`

**Step 5:** In a second terminal window, seed the application with data

`cd simplecqrs && npm run seed`{{execute T2}}

You'll get output similar to the following:

```
Seeded {"count":0,"customerEmail":"Katheryn.Batz@nels.info","customerFirstName":"Katheryn","customerLastName":"Batz","description":"eum sit atque earum"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":8,"customerEmail":"Lavonne.Kemmer@adolph.com","customerFirstName":"Lavonne","customerLastName":"Kemmer","description":"veritatis voluptas sint repellat"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":7,"customerEmail":"Christop.Kilback@myrna.org","customerFirstName":"Christop","customerLastName":"Kilback","description":"aut rerum quas hic"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":8,"customerEmail":"Cielo.O'Hara@janet.info","customerFirstName":"Cielo","customerLastName":"O'Hara","description":"explicabo aut ut dicta"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":7,"customerEmail":"Abbigail.Welch@murl.name","customerFirstName":"Abbigail","customerLastName":"Welch","description":"aliquid iste aspernatur natus"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":10,"customerEmail":"Henriette.DuBuque@ezra.org","customerFirstName":"Henriette","customerLastName":"DuBuque","description":"voluptatem nihil unde ut"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":2,"customerEmail":"Vivianne.Dibbert@westley.org","customerFirstName":"Vivianne","customerLastName":"Dibbert","description":"nemo est id molestiae"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":9,"customerEmail":"Hallie.Thiel@collin.info","customerFirstName":"Hallie","customerLastName":"Thiel","description":"cupiditate saepe dolores reprehenderit"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":7,"customerEmail":"Stephanie.Jones@martine.net","customerFirstName":"Stephanie","customerLastName":"Jones","description":"dolorum beatae repellendus nesciunt"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
Seeded {"count":2,"customerEmail":"Sarah.Hyatt@joannie.net","customerFirstName":"Sarah","customerLastName":"Hyatt","description":"inventore consequatur qui aut"}  at Wed Dec 30 2020 01:47:41 GMT+0000 (Coordinated Universal Time)
```

**Step 6:** Click the following link to verify that the data seeding has been successful.

https://[[HOST_SUBDOMAIN]]-9001-[[KATACODA_HOST]].environments.katacoda.com/orders



---

***Next: Analyzing the Application***