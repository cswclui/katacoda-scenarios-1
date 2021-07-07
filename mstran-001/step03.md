## Objective
The objective of this lesson is get the *Fortunes* microservice up and running and then to make some calls on it via `HTTP GET`.

## Steps

**Step 1:** Confirm you're in the microservice's working directory.

`cd ~/simplemicroservice`{{execute}}

`clear && pwd`{{execute}}

You get the following output:

`/root/simplemicroservice`

**Step 2:** In a second terminal window, start the microservice:

`cd /root/simplemicroservice`{{execute T2}}
`node index.js`{{execute T2}}


**Step 3:** In the first terminal window call the microservice 20 times using `curl`.

`for i in {1..20}; do curl localhost:3000 -w "\n"; done`{{execute T1}}

You'll see output similar to the following:

```
{"fortune":"C:\\ is the root of all directories."}
{"fortune":"You can't unscramble a scrambled egg."}
{"fortune":"A man of straw needs a woman of gold."}
{"fortune":"Penny wise, pound foolish."}
{"fortune":"If anything can go wrong, it will."}
{"fortune":"Windows will never cease."}
{"fortune":"The devil finds work for idle hands."}
{"fortune":"Familiarity breeds contempt."}{"fortune":"Like a fish out of water."}
{"fortune":"As is the gardener so is the garden."}
{"fortune":"A friend is easier lost than found."}
{"fortune":"A bird makes his nest little by little."}
{"fortune":"Pride cometh before a fall."}
{"fortune":"One man's meat is another man's poison."}
{"fortune":"You are what you eat."}
{"fortune":"Pride feels no pain."}
{"fortune":"Some of the best gifts come in small packages."}
{"fortune":"Blood is thicker than water."}
{"fortune":"If you tell the truth, you don't have to remember anything."}
{"fortune":"All work and no play makes Jack a dull boy."}

```

## Summary

Being able to run the microservice from the command line proves that the microservice is **discrete** and **emphemeral** but it has limited value in terms of supporting the  principle that a microservice is **transportable**. The next lesson is where we'll demonstrate how to make the microservice tranportable by making it so it can be run in a [Docker container](https://en.wikipedia.org/wiki/Docker_%28software%29).

---

***Next: Making the Microservice Transportable***
