## Objective
The objective of this lesson is to demonstrate how use and manage enternal configurations over multiple versions in order to make an applications flexible, scalable and easier to change.

In this lab we're going to compare two version of the lab's demonstration application to learn how control configuration changes across multiple versions.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

If the working directory is not `/root/12factor`, execute the following command:

`cd /root/12factor`{{execute}}

**Step 2:** Let's take a look at the existing dependencies list in `package.json` using the `jq` tool that's been installed into the Katacoda virtual machine automatically.

`jq .dependencies package.json`{{execute}}

You'll see output as follows:

```
{
  "dotenv": "^8.2.0",
  "uuid": "^3.3.3"
}
```

Notice that this version has only two packages listed. These are the only packages that this version of the code requires.

**Step 4:** Let's confirm that the dependencies we installed in the previous lesson are still in the working directory

`tree ./ -L 1`{{execute}}

You'll get the following output:

```
./
├── node_modules
├── package.json
├── package-lock.json
├── readme.md
├── server.js
└── test

```

**Step 5:** Start the demonstration application webserver in a second terminal window:

`cd 12factor && node server.js`{{execute T2}}

You'll get the following output:

HERE

**Step 6:** Make a `curl` call to the application in the first terminal window:

`curl http://localhost:3030`{{execute T1}}

You'll get the following output:

```
{
    "appName": "Pinger",
    "currentTime": "2020-12-06T18:23:31.454Z",
    "PINGER_PORT": "3030"
}
```

Pay attention to the output. We'll be comparing it to the output in the second version.

**Step 8:** Stop the web server that's running in the second terminal window:

`echo "Web server as been shut down"`{{execute interrupt T2}}

**Step 7:** Delete the `node_modules` directory that we intalled in the previous lesson

`rm -rf ./node_modules`{{execute T1}}

**Step 8:** Check out the second version of *Pinger* from the local `git` repo that we've just cloned from GitHub

`git checkout 2-dependencies.0.0.1`{{execute T1}}}

You'll see output as follows:

```
Branch '2-dependencies.0.0.1' set up to track remote branch '2-dependencies.0.0.1' from 'origin'.
Switched to a new branch '2-dependencies.0.0.1'

```

**Step 9:** Now let's take a look at the dependencies list in the second version of `package.json` using the `jq` tool.

`jq .dependencies package.json`{{execute T1}}}

You'll see output as follows:

```
{
  "dotenv": "^8.2.0",
  "faker": "^5.1.0",
  "uuid": "^3.3.3"
}
```

Notice the difference? You'll see that the package, [`faker`](https://www.npmjs.com/package/faker): "^5.1.0" has been added. Why has this addition been made?

The reason is because `faker` is needed to support a new feature of *Pinger*. This new feature will return a randomMessage as part of the HTTP response.

**Step 10:** Install the dependencies for the new, second version

`npm install`{{execute T1}}

**Step 11:** Start the web server in a second terminal window.

`node server.js`{{execute T2}}

You'll get the following output:

`API Server is listening on port 3030`

**Step 12:** Make a call the web server.

`curl http://localhost:3030`{{execute T1}}

You'll get the following output:

```
{
    "appName": "Pinger",
    "currentTime": "2020-12-06T18:24:51.495Z",
    "PINGER_PORT": "3030",
    "randomMessage": "totam inventore quis natus atque",
    "correlationId": "e45cc945-85eb-45fd-8f27-ae276d767178"
}
```

Notice that the applications response has an added attribute in the JSON, `randomeMessage` as well as the attribute, `correlationId`. These are new attributes are special this version. Also, the value for the attribute, `randomeMessage` is generated using the `faker` module has been added to the application as an independent dependency.

## Discussion

The important concept demonstrated in this lesson is that the demonstration application code contained only the logic with was relevant to its purpose and that it relied upon a dependency to provide the additional intelligence needed to realize the new feature.

Separating code from dependencies is an essential principle of 12 Factor App. Dependency separation makes it a lot easier to manage applications over the long run.

---

**Congratulations!** You've finished the scenario.