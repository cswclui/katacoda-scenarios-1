## Objective
The objective of this lesson exercise the asynchronous version of MOA *Fortune Cookies*.

In this lesson we'll view the ongoing log stream for each of the microservices that are receiving messages from message broker.

## Steps

Wait about 10 seconds for the MOA to warm up and then check the logs of some of the target pods

**Step 1:**  View the logs for the `sender` microservice:

`kubectl logs sender -f`{{execute T1}}

You'll get an output stream similar to the following:

```
.
.

{"service":"SENDER","handler":"onFortunesMessageReceived","mode":"PUBLISHED","message":"{\"fortune\":{\"fortune\":\"Memory is the treasure of the mind.\"},\"sendDate\":\"2021-01-14T18:48:29.056Z\",\"source\":\"FORTUNES\"}","from":null,"to":"fc_sender_out","createdOn":"2021-01-14T18:48:29.062Z","rslt":{"response":0}}
{"service":"SENDER","handler":"onFortunesMessageReceived","mode":"PUBLISHED","message":"{\"fortune\":{\"fortune\":\"Diligence is the mother of good luck.\"},\"sendDate\":\"2021-01-14T18:48:29.057Z\",\"source\":\"FORTUNES\"}","from":null,"to":"fc_sender_out","createdOn":"2021-01-14T18:48:29.062Z","rslt":{"response":0}}
{"service":"SENDER","handler":"onFortunesMessageReceived","mode":"PUBLISHED","message":"{\"fortune\":{\"fortune\":\"Different strokes for different folks.\"},\"sendDate\":\"2021-01-14T18:48:29.057Z\",\"source\":\"FORTUNES\"}","from":null,"to":"fc_sender_out","createdOn":"2021-01-14T18:48:29.062Z","rslt":{"response":0}}
{"service":"SENDER","handler":"onFortunesMessageReceived","mode":"PUBLISHED","message":"{\"fortune\":{\"fortune\":\"Stop beating around the bush.\"},\"sendDate\":\"2021-01-14T18:48:29.057Z\",\"source\":\"FORTUNES\"}","from":null,"to":"fc_sender_out","createdOn":"2021-01-14T18:48:29.062Z","rslt":{"response":0}}
.
.
.

```

Shutdown the log stream

`echo "Ctrl+C"`{{execute interrupt T1}}

**Step 2:** View the logs for the `scheduler` microservice:

`kubectl logs scheduler -f`{{execute T1}}


You'll get an output stream similar to the following:

```
.
.
[SCHEDULER] is used Publisher 6131dd62-389a-4771-8814-147a2fe0919e and published message, {"target":"SMS","payload":{"firstName":"Brown","lastName":"Keeling","id":"2f789ae7-34c0-4d97-9f03-6e2def51d60c","phone":"310-111-2222","email":"Brown.Keeling@cale.info"},"sender":"SCHEDULER","sendDate":"2021-01-14T18:51:29.002Z"} at Thu Jan 14 2021 18:51:29 GMT+0000 (UTC) with response [object Object].
Publisher f22a6d08-5ff9-4f1a-bbeb-07883e29743e published a message, {"target":"SMS","payload":{"firstName":"Jeanette","lastName":"Rice","id":"0b132759-00ba-452a-939c-7731974bee16","phone":"310-111-2222","email":"Jeanette.Rice@zion.name"},"sender":"SCHEDULER","sendDate":"2021-01-14T18:51:29.003Z"}to channel fc_sender_out at Thu Jan 14 2021 18:51:29 GMT+0000 (UTC) with response 1
[SCHEDULER] is used Publisher f22a6d08-5ff9-4f1a-bbeb-07883e29743e and published message, {"target":"SMS","payload":{"firstName":"Jeanette","lastName":"Rice","id":"0b132759-00ba-452a-939c-7731974bee16","phone":"310-111-2222","email":"Jeanette.Rice@zion.name"},"sender":"SCHEDULER","sendDate":"2021-01-14T18:51:29.003Z"} at Thu Jan 14 2021 18:51:29 GMT+0000 (UTC) with response [object Object].
Publisher 05ec79ec-8f46-4f2e-a0b8-73ff6a7f0aba published a message, {"target":"SMS","payload":{"firstName":"Rebeka","lastName":"Ebert","id":"1d2e3bf6-a90d-435d-adcb-afe26982971c","phone":"310-111-2222","email":"Rebeka.Ebert@logan.com"},"sender":"SCHEDULER","sendDate":"2021-01-14T18:51:29.003Z"} to channel fc_sender_out at Thu Jan 14 2021 18:51:29 GMT+0000 (UTC) with response 1
[SCHEDULER] is used Publisher 05ec79ec-8f46-4f2e-a0b8-73ff6a7f0aba and published message, {"target":"SMS","payload":{"firstName":"Rebeka","lastName":"Ebert","id":"1d2e3bf6-a90d-435d-adcb-afe26982971c","phone":"310-111-2222","email":"Rebeka.Ebert@logan.com"},"sender":"SCHEDULER","sendDate":"2021-01-14T18:51:29.003Z"} at Thu Jan 14 2021 18:51:29 GMT+0000 (UTC) with response [object Object].
Publisher 9f602ca0-e237-443e-9468-468aef61c705 published a message, {"target":"SMS","payload":{"firstName":"Aidan","lastName":"Abshire","id":"17f9ca53-0717-47b0-affb-73fc64ac2650","phone":"310-111-2222","email":"Aidan.Abshire@bernadette.info"},"sender":"SCHEDULER","sendDate":"2021-01-14T18:51:29.004Z"} to channel fc_sender_out at Thu Jan 14 2021 18:51:29 GMT+0000 (UTC) with response 1
[SCHEDULER] is used Publisher 9f602ca0-e237-443e-9468-468aef61c705 and published message, {"target":"SMS","payload":{"firstName":"Aidan","lastName":"Abshire","id":"17f9ca53-0717-47b0-affb-73fc64ac2650","phone":"310-111-2222","email":"Aidan.Abshire@bernadette.info"},"sender":"SCHEDULER","sendDate":"2021-01-14T18:51:29.004Z"} at Thu Jan 14 2021 18:51:29 GMT+0000 (UTC) with response [object Object].
Publisher 43170541-2f5c-4ad2-8b16-ca21ef4845d6 published a message, {"target":"SMS","payload":{"firstName":"Zelma","lastName":"Hilpert","id":"07c7c3ed-67c5-45e7-ba7b-1cebdb7d66d3","phone":"310-111-2222","email":"Zelma.Hilpert@zakary.info"},"sender":"SCHEDULER","sendDate":"2021-01-14T18:51:29.016Z"} to channel fc_sender_out at Thu Jan 14 2021 18:51:29 GMT+0000 (UTC) with response 1
.
.
```

Shutdown the log stream

`echo "Ctrl+C"`{{execute interrupt T1}}

**Step 3:** View the logs for the `fortunes` microservice:

`kubectl logs fortunes -f`{{execute T1}}

You'll get an output stream similar to the following:

```
.
.
[SENT FORTUNE], {"fortune":{"fortune":"Business before pleasure."},"sendDate":"2021-01-14T18:50:39.037Z","source":"FORTUNES"}  from channel, fc_fortunes_in to fc_fortunes_out at Thu Jan 14 2021 18:50:39 GMT+0000 (UTC)
[SENT FORTUNE], {"fortune":{"fortune":"Deeds are fruits, words are but leaves."},"sendDate":"2021-01-14T18:50:39.038Z","source":"FORTUNES"}  from channel, fc_fortunes_in to fc_fortunes_out at Thu Jan 14 2021 18:50:39 GMT+0000 (UTC)
[SENT FORTUNE], {"fortune":{"fortune":"Silence is golden."},"sendDate":"2021-01-14T18:50:39.039Z","source":"FORTUNES"}  from channel, fc_fortunes_into fc_fortunes_out at Thu Jan 14 2021 18:50:39 GMT+0000 (UTC)
[SENT FORTUNE], {"fortune":{"fortune":"A cat has nine lives."},"sendDate":"2021-01-14T18:50:39.040Z","source":"FORTUNES"}  from channel, fc_fortunes_in to fc_fortunes_out at Thu Jan 14 2021 18:50:39 GMT+0000 (UTC)
[RECEIVED MESSAGE], {"target":"SMS","payload":{"firstName":"Marvin","lastName":"Gaylord","id":"d90e45c1-326a-46d8-a226-a180ed12c2ed","phone":"310-111-2222","email":"Marvin.Gaylord@aron.info"},"sender":"SCHEDULER","sendDate":"2021-01-14T18:50:39.005Z"}  from channel, fc_fortunes_in at Thu Jan 14 2021 18:50:39 GMT+0000 (UTC)
[RECEIVED MESSAGE], {"target":"SMS","payload":{"firstName":"Jeanette","lastName":"Rice","id":"0b132759-00ba-452a-939c-7731974bee16","phone":"310-111-2222","email":"Jeanette.Rice@zion.name"},"sender":"SCHEDULER","sendDate":"2021-01-14T18:50:39.006Z"}  from channel, fc_fortunes_in at Thu Jan 14 2021 18:50:39 GMT+0000 (UTC)
[RECEIVED MESSAGE], {"target":"SMS","payload":{"firstName":"Erwin","lastName":"Maggio","id":"26be7517-a28e-4b11-9ce8-66d0ebc61457","phone":"310-111-2222","email":"Erwin.Maggio@edwina.name"},"sender":"SCHEDULER","sendDate":"2021-01-14T18:50:39.006Z"}  from channel, fc_fortunes_in at Thu Jan 14 2021 18:50:39 GMT+0000 (UTC)
.
.
.
```

Shutdown the log stream

`echo "Ctrl+C"`{{execute interrupt T1}}

The output above indicates that the *Fortune Cookie* microservices are consuming and emitting messages as expected.

---

***Next: Understanding the code***