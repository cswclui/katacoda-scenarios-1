## Objective
The objective of this lesson is examine the structure of the demonstration application, *Food Court* to see how the code support notion of a stateless processe as prescribed by the 12 Factor App principle of Processes

## Steps

**Step 1:** View the file and directory structure of the demonstration application

`tree ./ -L 1`{{execute T1}}

You'll get the following output:

```
./
├── burgerqueen
├── customer
├── docker-compose.yaml
├── docker-seed.sh
├── hobos
├── iowafried
└── readme.md

```
The directories, `burgerqueen`, `customer`, `hobos` and `iowafried` in the tree above contain the code for each of the processes that will be represented in a distinct container.

The file, `docker-seed.sh` is a utility script the creates a Local Docker Registry and then creates a docker image according to the `Dockerfile` that is stored along with the application code in each process directory. The docker image that is created is then stored in the Local Docker Registry.

**Step 2:** View the contents of `docker-seed.sh`

`cat `docker-seed.sh`{{execute T1`}}

Each process runs as a webserver making it so the only means of interaction between processes is via standard [HTTP reqeust methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods) between the web servers.

None of the processes/webservers maintain state. In the case of `customer`, all it knows how to do is to find a `restaurant` and random. All a `restaurant` knows is how to pick an order off its menu at random and deliver it to the caller. The restaurant has now idea about the customer other than the information it's given at the time of the request.

Isolating the code in isolated processes makes maintaining the code for each process easier.

**Step 3:** List the docker images in the Local Container Registry

`curl http://localhost:5000/v2/_catalog`{{execute T1}}

You'll get the following output:

```
{"repositories":["burgerqueen","customer","hobos","iowafried"]}

```

**WHERE**

* **customer** is a process that is an emulation of a customer buying food at a food counter in a food court
* **burgerqueen** is a food counter in the food court
* **hobos** is a food counter in the food court
* **iowafried** is a food counter in the food court

Each of these images represent of the distinct, stateless containers that will make up the processes for the entirety of the demonstration application.

***Next: Running the demonstration application***