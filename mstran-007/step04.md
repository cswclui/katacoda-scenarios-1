## Objective
The objective of this lesson is analyzed the Strangler Lite code to see how the Strangler Pattern is implemented.

## What You'll Be Doing

![Fortune Cookies Components](mstran-007/assets/basic-architecture-components.png)

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

* `config`, `data` and `init` are directories that created by the database upon invocation
* `docker-compose.yml` is the file the contains the `Docker Compose` configuration settinsg
* `monolith` contains the source code the *Fortunes Cookies* monolithic application
* `report_gen` is the directory that has the source code for the service that consumes the data emitted from the refactored `send` component.
* `README.md` is the conventional file that contains content in markdown format that provides documentation about the project

The interested work takes place in the `sender` component in the *Fortunes Cookies* monolithic application so let's go there.

**Step 3:** Take a look at the file that contains the `sender` code. 

`vi monolith/sender/index.js`{{execute T1}}

Turn on line numbering:

**Step 4:** Turn on line numbering in the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

and then enter:

`:set number`{{execute T2 T1}

---

***Congratulations!:*** You've compelete the lab 