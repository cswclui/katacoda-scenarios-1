## Objective
The objective of this lesson is to get the demonstration code up and running.

##What You'll Be Doing

In this lesson we're going to bring the demonstration code which is a monolithic version of the service, *Fortune Cookies* up and running as a docker container.

## Steps

**Step 1:** Confirm the working directory for the monolithic verison of *Fortune Cookies*.

`clear && cd ~/fortune-cookies/monolith && pwd`{{execute T1}}

You'get get the following output:

`/root/fortune-cookies/monolith`

**Step 2:** Build a Docker image of the application:

`docker build -t monolith .`{{execute T1}}

**Step 3:** Create a Docker container:

`docker run -p 3000:3000 -d --name fc-monolith monolith`{{execute T1}

Give things a minute to "warm up"


**Step 4:** Do a log dump to see scheduler activity:

`docker logs --tail 2500 fc-monolith`{{execute T1}}

You'll get output similar to the following"

```
Greetings from Ronny McCullough: Take your wife's first advice.
Greetings from Antonio Parker: A single penny fairly got is worth a thousand that are not.
Greetings from Hollis Skiles: He is rich that is satisfied.
Greetings from Carson Pollich: You are what you eat.
Greetings from Gianni O'Conner: You can't make a silk purse out of a sow's ear.
Greetings from Eve Farrell: There's many a slip 'twixt the dock and the ship.
Greetings from Hardy Brakus: You can't teach a new mouse old clicks.
Greetings from Arvilla Hoppe: All's fair in love and war.
Greetings from Remington Bechtelar: Shake the hand before you plough the field.
Greetings from Bette Collins: A friend in need is a friend indeed.
Greetings from Laurine Kirlin: A stitch in time saves nine.
Greetings from Ima Satterfield: Step by step one goes far.
Greetings from Christine Hodkiewicz: Take your wife's first advice.
Greetings from Humberto West: The wise man is deceived once but the fool twice.
Greetings from Addie D'Amore: After dinner rest a while, after supper walk a mile.

```

---

***Next: TO BE PROVIDED***