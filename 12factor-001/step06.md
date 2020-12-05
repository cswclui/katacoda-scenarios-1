## Objective
The objective of this lesson is demonstrate how to demonstrate how to execute the tests that ship with the lab's demonstration application as part of the code download from GitHub.

**Remember!** A key concept in the Codebase principle of 12 Factor App is that all assets relevant to an application are stored in the application's central repository. This includes application tests. The demonstration application, *Pinger* contains its tests.

## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

If you are not in that working director, execute the following command: `cd /root/12factor`{{execute}}.

**Step 2:** Run the tests that ship with the code.

`npm test`{{execute}}

You'll see output as follows:

We've tested the application to verity that the code is operational. The next lesson is the get the application up and runnig.

---

***Next: Running the Application***