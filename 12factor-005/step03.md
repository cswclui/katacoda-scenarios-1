## Objective
The objective of this lesson is to review the `Jenkinsfile` that Jenkins will use to run the Build and Release states of the 12 Factor App principle of [Build, Release, Run](https://12factor.net/build-release-run). Also, we're going to demonstrate how to create the Jenkins Multibranch Pipeline job that will execute the Build and Release stages automatically.

## Steps

**Step 1:** Return the the lesson code's working directory.

`cd /root/12factor`{{execute T1}}

**Step 2:** View the contents of the directory, `./12factor/`

`clear && tree ./ -L 2`{{execute}}

You'll see output as follows:


```
./
├── Dockerfile
├── env.list
├── index.js
├── Jenkinsfile
├── package.json
├── readme.md
└── test
    └── http-tests.js

```

There are three files of particular interest in the working directory. There's the `Jenkinsfile` that contains the pipeline script that will execute the Build and Release tasks in Jenkins.

The file, `Dockerfile` provides the description of the container image that Jenkins will build during the Run stage. (To learn more about `Dockerfile` go [here](https://docs.docker.com/engine/reference/builder/).)

The file, `env.list` describes the environment variables that Docker will inject into the demonstration application when it is run as a Docker container during the Run stage in the next lesson.

Let's look at `Jenkinsfile.`

**Step 3:** Open the file, `Jenkinsfile` in the `vi` editor:

`vi ./Jenkinsfile`{{execute}}

**Step 4:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq}}

and then enter:

`:set number`{{execute}}

Notice the `Jenkinsfile` describes 3 stages. There's the stage, `build ` at `Line 5` that has the instructions to get the code for the demonstration application from GitHub and then install the dependencies that the demonstration application needs. This is the actual implmentation of the `Build` stage as described by 12 Factor App.

The `test` stage starts at `Line 12`. While Build, Release, Run does not mandate testing your build, it's always a good idea to run any tests available to make sure all is well.

The `Release` stage starts at `Line 17`. This is the point where Jenkins will create a container image of the demonstration application and then "push" (a.k.a. Release) that created container image into the Local Container Repository. Once the container image is in the Local Container Repository it is avaiable to be used in an runtime environment that has access to the container repository.

Now the we've covered the structure of the `Jenkinsfile`, let's take a look at how to get Jenkins to identify it in the source code repository on GitHub and run it automatically.

But, before we do, we need to get out of the `vi` editor.

**Step 5:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 6:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

**Step 7:** View the following video that demonstrates how to bind the Jenkins job to the `Jenkinsfile` in the the source code GitHub repository for this lesson. Once you job is bound, Jenkins will automatically identify and read the `Jenkinsfile` in the source code directory and excecute the tasks within.

<iframe width="560" height="315" src="https://www.youtube.com/embed/PrttXoc2d7s" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Summary

In this step we bound Jenkins to a `Jenkinsfile` in the lesson's GitHub repository and made it so that Jenkins created a container image of the demonstration application, *Secret Society*. Jenkins stored that container iamge in the Local Container Repository which you can access from the Katacoda command line.

Next we'll work at the Katacoda command line to start and call the demonstration application by running it as Docker container. The container image that we'll use will be the one that Jenkins stored in the Local Container Repository.

---

***Next: Running the Demonstration Application Using the Local Container Registry***




