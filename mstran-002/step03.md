## Objective
The objective of this lesson is demonstrate how to exercise the demonstration monolithic service.

## Steps

**Step 1:** Do a log dump to see scheduler activity:

`docker logs --tail 2500 fc-monolith`{{execute T1}}

You should see some screen chatter similiar to this:

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

**Step 2:** Add a user using `curl`:

`curl -X POST 'http://localhost:3000/api/users' -H 'Accept-Encoding: gzip, deflate, br' -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'Connection: keep-alive' -H 'DNT: 1' -H 'Origin: http://localhost:3000' --data '{"firstName":"Cool", "lastName":"McCool", "dob":"1979-01-27", "email":"cool.mccool@reallycool.com"}'`{{execute T1}}

If a user is saved to the system, the user data will be returned with a system assigned id, similar to the following:

```
{"id":"89b689dd-0f94-43f1-93d8-e1fa2564fd4d","firstName":"Cool","lastName":"McCool","dob":"1979-01-27"}

```

**Step 3:** Execute the following command to see if Cool McCool is active.

`docker logs --tail 2500 fc-monolith | grep McCool`{{execute T1}}

When you take a look at the logs again, you will see that Cool McCool is sending fortunes out too with output similar to this:

```
Greetings from Cool McCool: Spare the rod and spoil the child.
Greetings from Cool McCool: Every man is the architect of his destiny.
Greetings from Cool McCool: The geek shall inherit the earth.
Greetings from Cool McCool: A bird in the hand is worth two in the bush.
Greetings from Cool McCool: If at first you don't succeed, try, try again.
Greetings from Cool McCool: Listen to the pot calling the kettle black.
Greetings from Cool McCool: The best of friends must part.
Greetings from Cool McCool: Up and down like a fiddler's elbow.
Greetings from Cool McCool: Old friends and old wine are best.
Greetings from Cool McCool: If you lie down with dogs, you'll get up with fleas.

```

---

***Next: TO BE PROVIDED***