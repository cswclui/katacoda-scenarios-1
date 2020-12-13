## Objective
The objective of this lesson is examine the structure of the demonstration application, *Food Court* to see how the code support the 12 Factor App principle of Processes

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
└── payments

```

**Step 2:** List the docker images in the Local Container Registry


`curl http://localhost:5000/v2/_catalog`{{execute T1}}

You'll get the following output:

```
{"repositories":["burgerqueen","customer","hobos","iowafried"]}

```

Each of these images represent a distinct, stateless process

**WHERE**

* **customer** is a process that is an emulation of a customer buying food at a food counter in a food court
* **burgerqueen** is a food counter in the food court
* **hobos** is a food counter in the food court
* **iowafried** is a food counter in the food court

***Next: Running the demonstration application***