This project, Rales Engine, serves up an API of data from Sales Engine, a Turing School project that showcases database relationships through sales data. Rales Engine takes the CSV data from Sales Engine and generates a number of API endpoints for one to consume this data.

To get started:

```
git clone git@github.com:julyytran/rales_engine.git
cd rales_engine
rake db:{drop,create,migrate}
rake import:data```

Once the data has been imported, run `rake routes` to view all the available endpoints. Data categories consist of six models: merchants, customers, items, invoice items, invoices, and transactions. Each of these categories contain an endpoint to view all, view one, find all, and find one. Additional endpoints include viewing a random merchant and viewing several business analytics.
