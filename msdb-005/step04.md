## Objective
The objective of this lesson is to analyze the Strangler Lite code to see how the Strangler Pattern is implemented.

## What You'll Be Doing
In this lesson we're going to look at how the Stranger Pattern is implemented in the `sender` component of the monolithic *Fortune Cookies*. Remember, the purpose of `sender` is to send fortunes onto intended targets.

![Fortune Cookies Components](msdb-005/assets/basic-architecture-components.png)

The approach that Strangler Lite takes is to add a custom made `DataManager` component into the monolithic application. `DataManager` encapsulates data access activity to a MariaDB database using the [Sequilize](https://sequelize.org/) Node.js library. Also, a few lines of code will be added to the `sender` component. This added code will uses the `DataManager` to emit *sent Fortune* data to the external MariaDB database.

![Strangler Architecture](msdb-005/assets/strangler-lite-architecture.png)


## Steps

**Step 1:** Confirm you're in the working directory:

`clear && cd ~/fortune-cookies/monolith_strangled/ && pwd`{{execute T1}}

**Step 2:** Take a look at the directory and file structure of the working directory

`tree -L 1`{{execute T1}}

You'll get following output:

```
.
├── config
├── data
├── docker-compose.yml
├── init
├── monolith
├── README.md
└── report_gen

```

**WHERE**

* `config`, `data` and `init` are directories that were created in the local file system according to the volume configuration for the database container as described in the `docker-compose.yml` file.
* `docker-compose.yml` is the file the contains the `Docker Compose` configuration settinsg
* `monolith` contains the source code the *Fortunes Cookies* monolithic application
* `report_gen` is the directory that has the source code for the external service that consumes the data emitted from the refactored `send` component.
* `README.md` is the conventional file that contains documentation content in markdown format

`report_gen` is a new service, external to *Fortunes Cookies* that will consume data cominng out of the monolith. The interesting work takes place in the `sender` component in the *Fortunes Cookies* monolithic application so let's go there.

**Step 3:** Take a look at the file that contains the `sender` code. 

`vi monolith/sender/index.js`{{execute T1}}

Turn on line numbering:

**Step 4:** Turn on line numbering in the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

and then enter:

`:set number`{{execute T1}}

Take a look at the `send` function which starts at `Line 7`. The comments in the code describe the old code and where the stranger code is added. The strangling code runs between `Lines 15 -22`.

Also, part of the strangling code is the addition of the `DataManager` which contains the [ORM](https://en.wikipedia.org/wiki/Object%E2%80%93relational_mapping) that encapsulates the data access activity to the MariaDB data base. The ORM that's used in the DataManager is the Node.js library, [Sequilize](https://www.npmjs.com/package/sequelize).

The last piece to look at is the `report_gen` service. This is the service that consumes the data emitted from `sender` into the external database.

**Step 5:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

**Step 6:** Exit `vi`

`:q!`{{execute T1}}

You have exited `vi`.

**Step 7:** Go to directory that has the `report_gen` web server source code:

`cd ~/fortune-cookies/monolith_strangled/report_gen/`{{execute T1}}

**Step 8:** Take a look at the web server code:

`vi index.js`{{execute T1}}

Turn on line numbering:

**Step 9:** Turn on line numbering in the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

and then enter:

`:set number`{{execute T1}}

The code of interest is betweel `Lines 7 - 25`.

Notice at `Line 18` that the code uses the `getSentFortunes()` method from the `DataManager` component to access the *sent fortunes* data in the data source. As mentioned above, `DataManager` encapsulates data access activities to and from the external data source. The method, `getSentFortunes()` takes a single optional argument, `limit`. `limit` is derived from the `request` query parameter of the same name. If `request.query.limit` contain a numeric value, then `DataManager.getSentFortunes(limit)` will return the number of fortunes defined by `limit`. Otherwise, `DataManager.getSentFortunes()` will return the default number of rows, `10`,

**Step 10:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

**Step 11:** Exit `vi`

`:q!`{{execute T1}}

You have exited `vi`.

## Conclusion 

In closing you can see that by adding a new component, `DataManager` and adding a few lines of new code in `sender` we've made it so *Fortune Cookies* can export *sent Fortunes* data to an external data source. Once the data is externalized, it can be consumed by any interested party such as `report_gen`.

Of course, there is more work to do. Eventually `sender` will need to be disconnected from the monolithic *Fortune Cookies* completely. This will take a lot more work. But, no matter what, starting to strangle `sender` by emitting it's data to an external data source is an important first step.

---

***Congratulations!:*** You've compelete the lab 