## Objective
The objective of this lesson is to exercise the Strangler Lite code to get a sense of how the data that's being emitted from the *Fortunes Cookies* monolithic application.

## Steps

**Step 1:** Confirm the working directory for the monolithic applications.

`clear && cd ~/fortune-cookies/monolith_strangled/ && pwd`{{execute T1}}

You'll see output as follows:

`fortune-cookies/monolith_strangled`

**Step 2:** Using `localhost` call the `report_gen` service to data that been externalized from the *Fortunes Cookies* monolithic application.

**Step 3:** In a separate terminal window, run `curl ` against the `report_gen` service, like so:

`curl localhost:3003?limit=6`{{execute T1}}

**WHERE**

* `curl` the command to call the `report_gen` service
* `localhost:3003` is the URL against which `report_gen` is running
* `?limit=6` is the query parameter the declares the number of records to return. If no value is set to `limit`, the default number of records returned is ``0`.

You'll get output similar to the following:

```
[
{"id":"002f93d1-1210-4d26-b3a1-bb7a8f858d7d","firstName":"Eve","lastName":"Farrell","fortune":"The love of money is the root of all evil.","createdAt":"2021-01-11T03:02:48.000Z","updatedAt":"2021-01-11T03:02:48.000Z"},
{"id":"0048380b-05ba-4921-8e7d-317e7a612051","firstName":"Remington","lastName":"Bechtelar","fortune":"If it's not broke, mess with it till it is.","createdAt":"2021-01-11T03:04:46.000Z","updatedAt":"2021-01-11T03:04:46.000Z"},
{"id":"00639aef-a9b2-46dd-9969-d368fb583433","firstName":"Bette","lastName":"Collins","fortune":"A light purse makes a heavy heart.","createdAt":"2021-01-11T03:02:58.000Z","updatedAt":"2021-01-11T03:02:58.000Z"},
{"id":"008dec1d-272d-4951-b520-3c0f1c2f1235","firstName":"Eve","lastName":"Farrell","fortune":"We cannot erase the sad records from our past.","createdAt":"2021-01-11T03:05:20.000Z","updatedAt":"2021-01-11T03:05:20.000Z"},
{"id":"00a91ce4-d29a-4e92-996f-68927af2ce99","firstName":"Laurine","lastName":"Kirlin","fortune":"Be not a baker if your head is made of butter.","createdAt":"2021-01-11T03:05:21.000Z","updatedAt":"2021-01-11T03:05:21.000Z"},
{"id":"00b35391-3840-4799-b7a2-40963c0f1da6","firstName":"Laurine","lastName":"Kirlin","fortune":"You are what you eat.","createdAt":"2021-01-11T03:04:18.000Z","updatedAt":"2021-01-11T03:04:18.000Z"}
]

```


---

***Next: Analyzing the code***