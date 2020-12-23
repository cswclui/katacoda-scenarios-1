## Objective
The objective of this lesson is demonstrate how to clone from GitHub the project code you'll be using in this lab.

## Steps

**Step 1:** Clone the demonstration project code from the GitHub Repo:

`git clone https://github.com/reselbob/simplemicroservice.git`{{execute}}

**Step 2:** Go to the demonstration project working directory:

`cd simplemicroservice`{{execute}}

**Step 3** Install the external dependencies:

`npm install`{{execute}}

You'll get output similar to the following:

```
added 174 packages from 576 contributors and audited 174 packages in 6.161s

18 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities

```

**Step 4** Run the demonstration project's unit tests

`npm test`{{execute}}

```
.
.

Data initialized at : Wed Dec 23 2020 18:10:49 GMT+0000 (Coordinated Universal Time)
Sending fortune {"fortune":"He who rises late must trot all day."} at Wed Dec 23 2020 18:10:49 GMT+0000 (Coordinated Universal Time)
GET / 200 15.730 ms - 50

  Fortunes Tests:
{
  status: 'SHUTDOWN',
  shutdownMessage: 'Fortunes service shutting down at Wed Dec 23 2020 18:10:49 GMT+0000 (Coordinated Universal Time)',
  pid: 4461

```

---

***Next: Examining the Code***