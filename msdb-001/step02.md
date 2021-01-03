## Objective
The objective of this lesson is analyze the code of the demonstration microservice, *Fortunes* to discover how it supports the essential principles of database design for microservices.

A microservice...

* **has a single responsility**
* **is discrete**
* **carries its own data**
* **is transportable**
* **is ephemeral**

The purpose of the demonstration microservice, *Fortunes* is to deliver some "words of wisdom" on demand. This is the microservice's **single purpose**. The demonstration microservice runs as an API under a webserver. It is **discrete** in that it carries all it needs to do its work. No external tools need to be injected. And, the microservice **carries its own data** which is kept private interally. There is no data sharing going on behind the scenes.

The microservice is **transportable** in that it can be moved and run on a variety of target environments easily. Finally, it is **ephemeral** because if it is destroyed it can be reconstituted quickly and easily.

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

The key file to take notice of is `index.js`. `index.js` contains the code the runs the webserver that represents the microservice to the network. The directory, `dataManager` contains the code that provides data to the microservice.

**Step 2:** Take a look at the files in the directory, `dataManager`.

`tree ./dataManager/ -L 1`{{execute}}

You'll get the following output:

```

./dataManager/
├── fortunes.txt
└── index.js

```
The text file, `fortunes.txt` has the data which the microservice provides to the webserver. The file, `index.js` contains the logic that retrieves data from the text file, `fortunes.txt`

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

Each line of the text file is a "words of wisdom" that you would typically find in a fortune cookie. Granted, the data is a bit trivial, but it does serve the purpose of the microservice. Also, as we discussed above, this data is dedicated to the service and apparent only within the operational boundary of the service. No other service has indirect access to this data.

Let's take a look at the webserver code that's driving the microservice.

**Step 4:** Open the file `index.js` source code in `vi`.

`vi index.js`{{execute}}

**Step 5:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq}}

and then enter:

`:set number`{{execute}}

`Line 8` is an important line of code. That line imports the function, `getRandomFortune()` from the `dataManager` module. `getRandomFortune()` has logic that goes into the text file,`fortunes.txt` and selects a random line of text to return to the function's caller.

Deliverying that one line of text is the sole responsibility of the microservice. And, that text comes from the unique data that the service carries.

Let's go and see how `getRandomFortune()` is used in the server.

**Step 6:** Go to down in the webserver code.

Press the ESC key: `^ESC`{{execute ctrl-seq}}

`:38`{{execute}}

`Lines 29 - 34` is where the actual work is done to deliver the fortune to the caller of the API. Notice when an HTTP request is made at the `/` entry point to the API. The webserver code calls `getRandomFortune()` and returns the retrieved `fortune` in JSON format as a`response` to the `request`.

The implementation is simple but it's effective. The microservice does one thing and one thing only. And, it uses data that's confined to the contextual boundary of the microservice.

**Step 7:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 8:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

## Summary

The important idea is this lesson in terms of database design for microservices is to understand that an essential principle of microservices is that **a microservice carries its own data**. In this case we saw how the microservice's data was stored in file, `fortunes.txt`.

## SOMETHING TO THINK ABOUT

If an essential principle of data design for microservices is that a microservice carries its own data, how can we get a microservice to scale into thousands of instances and yet provide data reliably. Running a lot of instances of the microservice using a text file for each service instance will work for trivial demonstration purposes, but in a production enviornment the burden of data access, even in a read scenario, can be overwhelming.

***How can we apply the principle that a microservice carries its own data to "real world" situations?***

---

***Next: Running the Code as a Microservice***