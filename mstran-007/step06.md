## Objective
The objective of this lesson is demonstrate how create the database trigger that will forward data onto the custom `receiver` service.

## What You'll Be Doing

```
TBP
```

## Steps

**Step 1:** Start the coding process to create the trigger:

`DELIMITER $`{{execute T3}}

**Step 2:** At the prompt of the database client, enter the code to create the update trigger:

```
CREATE TRIGGER upd_check
  AFTER INSERT ON SentFortunes
    FOR EACH ROW
      BEGIN
        DECLARE result char(255);
        DECLARE fortune char(255);
        set fortune = CONCAT(NEW.firstName, ", ", NEW.lastName, ", ", NEW.fortune);
        set result = http_get('http://receiver:3030', fortune);
      END;
$

```

**Step 3:** Go back to the first teminal window where the Docker-Compose containers are running. You'll see that the custom `receiver` service is processing data from the trigger in the database.

Once the connection between the database trigger and custom `receiver` is established and data is moving the `receiver` developers in the future can refactor the receiver to forward incoming data to a message broker.


The important thing to understand about the lab is that we've create a way to implement future features outside of the monolith. The only change we made to the monolith was to add the trigger to the database. We left the monolith application code alone.

Moving forward we can take this technique and emulate all the features in the existing monolith into external microservices. Once all features have been externalized, the monolith is "strangled" and can be decommissioned.

This is not easy work and will take time. Hopefully this lab demonstrates a technique you can use in your work.

***Congratulations*** You've complete the lab