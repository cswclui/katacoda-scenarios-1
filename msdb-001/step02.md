## Objective
The objective of this lesson is analyze the code of the demonstration microservice, *Fortunes* to discover how it supports the essential principles of database design for microservices.

A microservice...

* **has a single responsility**
* **is discrete**
* **carries its own data**
* **is transportable**
* **is ephemeral**

The purpose of the demonstration microservice, *Fortunes* is to deliver some words of wisdom on demand. This is the microservice's **single purpose**. The demonstration microservice runs as an API in webserver. It is **discrete** in that it carries all it needs to do the work it needs to do. No external tools need to be injected. And, the microservice **carries its own data** which is kept private interally. There is no data sharing going on behind the scenes.

The microservice is **transportable** in that it can be moved and run an a variety of target environments easily. Finally, it is **ephemeral** because if it is destroyed it can be reconstituted quickly and easily.

## Steps

**Step 1:** Examine the file structure of the demonstration service's working directory

`tree ./ -L 1`{{execute}}

You'll get the following output:

```
./
├── dataManager
├── Dockerfile
├── index.js
├── LICENSE
├── node_modules
├── package.json
├── package-lock.json
├── README.md
└── test

```

The key file to take notice is `index.js`. `index.js` contains the code the runs the webserver that represents the microservice to the network. The director, `dataManager` contains the code that provides data to the microservice.

**Step 2:** Take a look at the files in the directory, `dataManager`.

`tree ./dataManager/ -L 1`{{execute}}

You'll get the following output:

```

./dataManager/
├── fortunes.txt
└── index.js

```
The text file, `fortunes.txt` has the data which the microservice provides to services webserver. The file, `index.js` contains the logic that retrieves data from the text file, `fortunes.`

Let's take a look at some of the data in `fortunes.txt`.

**Step 3:** We'll look at the last ten lines of the file.


`clear && tail -n 10 ./dataManager/fortunes.txt`{{execute}}

You'll get output similar to the following:

```
You snooze, you lose.
Never test the depth of the water with both feet.
If you tell the truth, you don't have to remember anything.
A closed mouth gathers no foot.
You aren't learning much when your lips are moving.
Experience is something you don't get until just after you need it.
A hair on the head is worth two in the brush
An ear that doesn't heed to advice is chopped off together with the head.
The death of a cow marks celebration to even a dying dog.
You learn by looking and listening as opposed to talking. That's why you have two ears, two eyes, and only one mouth.

```

Each line the text file is some words of wisdom that you would typically find in a fortune cookie. Granted, the data is a bit trivial, but it does serve the purpose of the microservice. And, as we discussed above, this data is dedicated to the service within the operational boundary of the service. No other service has indirect access to this data.

Let's take a look at the webserver code that's driving microservice.

**Step 4:** Open the file `index.js` source code in `vi`.

`vi index.js`{{execute }}

**Step 5:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq}}

and then enter:

`:set number`{{execute}}

[DISCUSSION]

**Step 6:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 7:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

---

***Next: Running the Code as a Microservice***