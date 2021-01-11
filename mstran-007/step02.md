## Objective
The objective of this lesson is to get the demonstration code up and running.

## What You'll Be Doing

In this lesson we're going to examine the source code of the Stangler Lite version of *Fortune Cookies* to see how the `sender` component is in the early stage of being "strangled". Also, you look the the source code for service `report_gen`. The service, `report_gen` is a simple HTTP REST API that has a single endpoint the returns *sent Fortunes* data in JSON format. 

## Steps

**Step 1:** Go to the working directory with the course code of the Stangler Lite version of *Fortune Cookies*.

`clear && cd ~/fortune-cookies/monolith_strangled/monolith && pwd`{{execute T1}}

You'll see output as follows:

`fortune-cookies/monolith_strangled/monolith`

**Step 2:** Go to the code for the `sender` component.

`cd sender`{{execute T1}}