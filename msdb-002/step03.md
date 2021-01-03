## Objective
The objective of this lesson is examine a single source data architecture and discover how using the Command Query Responsibility Segregation pattern improves a microsevice's performance at web scale.

## Steps

**Step 1:** Take a look at the directory structure of the application's working directory:

`clear && tree ./dist/src -L 2`{{execute T2}}

Notice that the application has one datasource, a `mariadb` relational database.

Now let's look at how the datasource is used in the application:

**Step 2:** Open the application's TypeScript source code in the `vi` editor.

`vi src/app.ts`{{execute T2}}

**Step 3:** Turn on line numbering in the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

and then enter:

`:set number`{{execute T2}}

**Step 4:** Go down to `Line 60`.

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:60`{{execute T2}}

Notice the statement `dataManager.getOrders()` at `Line 39`. This is the code that gets `order` data from the datasource.

Notice the statement `dataManager.getOrder(req.params.id)` at `Line 47`. This is the code that gets data for a particular `order` from the datasource.

Notice the statement `dataManager.setOrders(imput)` at `Line 57`. This is the code that sets data for an `order` to the datasource.

The important thing to understand is that all `read` and `write` data access is being managed by a single database. The actual database is a `mariadb` instance that is encapsulated into the `dataManager`.

**Step 5:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 6:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

## Summary

The essential concept to remember in this lesson is that both `write` and `read` behavior is confined to a single datasource, the `mariadb` database.

In the next lesson we'll discuss the shortcoming that is inherent in using a single datasource data architecture and also discuss how to address the shortcoming.

---

***Next: Identifying opportunities for improvement***