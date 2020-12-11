## Objective
The objective of this lesson is to review the `Jenkinsfile` that Jenkins will use to run the Build and Release states of the 12 Factor App principle of [Build, Release, Run](https://12factor.net/build-release-run). Also, we're going to demonstrate how to create the Jenkins Multibranch Pipeline job that will execute Build and Release automatically.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

If the working directory is not `/root/12factor`, execute the following command:

`cd /root/12factor`{{execute T1}}

**Step 2:** View the contents of the directory, `./12factor/`

`clear && tree ./-L 1`{{execute}}

You'll see output as follows:


```
TBP

```

[DISCUSSION of the Diretory files]

**Step 3:** Open the file, `Jenkinsfile` in the `vi` editor:

`vi ./Jenkinsfile`{{execute}}

**Step 4:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq}}

and then enter:

`:set number`{{execute}}

[DISCUSSION of the Jenkinsfile]

**Step 4:** View the following animated GIF that demonstrates how to bind the Jenkins job the the source code GitHub for this lesson. Once you job is bound, Jenkins will automatically identify and read the `Jenkinsfile` in the source code diretory and excecute the tasks within.


## Summary

---

***Next: Running the Demonstration Application Using the Local Container Registry***




