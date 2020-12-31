## Objective
The objective of this lesson is to examine the shortcoming that is inherent when using a single data source to `write` and `read` data.

## Steps

**Step 1:** Confirm that you're in the lab's working directory

`cd ~/simplecqrs && pwd`{{execute T2}}

**Step 2:** Open the application's TypeScript source code in the `vi` editor.

`vi src/app.ts`{{execute T2}}

**Step 3:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

and then enter:

`:set number`{{execute T2}}

**Step 4:** Go down to `Line 60`.

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:60`{{execute T2}}

As we saw in the pervious lesson, the statement, `dataManager.getOrders()` at `Line 39` gets `order` data from the datasource. The statement, `dataManager.getOrder(req.params.id)` at `Line 47` gets data for a particular `order` from the datasource. The statement `dataManager.setOrders(imput)` at `Line 57` sets data for an `order` to the datasource.

Writing and reading to a single datasource is acceptable for small applications that have a limited number of transactions.

![Single Data Source Architecture](msdb-002/assets/CQRS-old-school.jpg)

However, when an application grows to web-scale in which there might be hundreds of thousands, if not millions of `reads` and `writes` a minute, performance can degrade.

The way to address this problem is to segregate `write` behavior and storage from `read` behavior and storage; hence the term Command Query Responsiblity Segregation (CQRS). Under CQRS a `write` is considered a command and a `read` is considered a query.

**Step 5:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 6:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

## Summary

Using a single source database architecture to support `write` and `read` activity is acceptable for small applications. But, for larger applications, using the CQRS pattern is a good way to address the performance degradation that can occur when a single source database architecture is overwhelmed.

In the next scenario you'll be introduced to the CQRS pattern by getting basic implementation up and running.

---

**Congratuations!** You've completed the lab.