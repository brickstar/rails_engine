# Rails Engine

This is a Rails-based versioned JSON API built using ActiveRecord that allows users to consume data from the SalesEngine data schema.

##

### Setup
To use this application, clone the following repository repository:

```
$ git clone https://github.com/brickstar/rails_engine
```

From the application directory, run the following commands to install and update all necessary gem dependencies:

```
$ bundle
$ bundle update
```

Run the following commands to create the database and import CSV data:

```
$ rake db:{create,migrate}
$ rake import:all
```

And initialize a server

```
$ rails s
```

##
### Versions

``Ruby 2.4.1``
``Rails 5.2.1``
``ActiveRecord 5.2.1``
``RSpec-Rails 3.8.0``

##
### Database Schema
![sales_engine](https://user-images.githubusercontent.com/33355897/44249305-7d186e00-a1ac-11e8-9b91-3a6e38c9b7d7.png)

## Endpoints

 `*  All references to :id in endpoints should be replaced with an integer corresponding to the desired record`
 

### Merchant Endpoints

##### Index
###### Request Url
```
localhost:3000/api/v1/merchants
```
###### Output
```json
[
  {
    "id":1,
    "name":"Schroeder-Jerde"
  },
  {
    "id":2,
    "name":"Klein, Rempel and Jones"
  },
  {
    "id":3,
    "name":"Willms and Sons"
  }
]
```
##### Show
###### Request URL
``localhost:3000/api/v1/merchants/:id``
###### Output
```json
{
  "id":1,
  "name":"Schroeder-Jerde"
}
```

##
### Item Endpoints
##### Index
###### Request Url
```
localhost:3000/api/v1/items
```
###### Output
```json
[
  {
	"id": 1,
	"description": "Nihil autem sit odio inventore deleniti. Est laudantium ratione 	distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.",
	"merchant_id": 1,
	"name": "Item Qui Esse",
	"unit_price": "751.07"
  },
  {
	"id": 2,
	"description": "Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. 	Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.",
	"merchant_id": 1,
	"name": "Item Autem Minima",
	"unit_price": "670.76"
  },
  {
	"id": 3,
	"description": "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.",
	"merchant_id": 1,
	"name": "Item Ea Voluptatum",
	"unit_price": "323.01"
  }
]
```
##### Show
###### Request URL
``localhost:3000/api/v1/items/:id``
###### Output
```json
{
  "id": 1,
  "description": "Nihil autem sit odio inventore deleniti. Est laudantium ratione 	distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.",
  "merchant_id": 1,
  "name": "Item Qui Esse",
  "unit_price": "751.07"
}
```
##
### Invoice Endpoints
##### Index
###### Request Url
```
localhost:3000/api/v1/invoices
```
###### Output
```json
[
  {
	"id": 1,
    "customer_id": 1,
	"merchant_id": 26,
	"status": "shipped"
  },
  {
	"id": 2,
	"customer_id": 1,
	"merchant_id": 75,
	"status": "shipped"
  },
  {
	"id": 3,
	"customer_id": 1,
	"merchant_id": 78,
	"status": "shipped"
  }
]
```
##### Show
###### Request URL
``localhost:3000/api/v1/invoices/:id``
###### Output
```json

{
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
}
```
##
##
### InvoiceItem Endpoints
##### Index
###### Request Url
```
localhost:3000/api/v1/invoice_items
```
###### Output
```json
[
  {
	"id": 1,
	"invoice_id": 1,
	"item_id": 539,
	"unit_price": "136.35",
	"quantity": 5
  },
  {
	"id": 2,
	"invoice_id": 1,
	"item_id": 528,
	"unit_price": "233.24",
	"quantity": 9
  },
  {
	"id": 3,
	"invoice_id": 1,
	"item_id": 523,
	"unit_price": "348.73",
	"quantity": 8
  }
]
```
##### Show
###### Request URL
``localhost:3000/api/v1/invoice_items/:id``
###### Output
```json
{
  "id": 3,
  "invoice_id": 1,
  "item_id": 523,
  "unit_price": "348.73",
  "quantity": 8
}
```

##
### Transaction Endpoints
##### Index
###### Request Url
```
localhost:3000/api/v1/transactions
```
###### Output
```json
[
  {
	"id": 1,
	"invoice_id": 1,
	"credit_card_number": "4654405418249632",
	"result": "success"
  },
  {
	"id": 2,
	"invoice_id": 2,
	"credit_card_number": "4580251236515201",
	"result": "success"
  },
  {
    "id": 3,
	"invoice_id": 4,
	"credit_card_number": "4354495077693036",
	"result": "success"
  }
]
```
##### Show
###### Request URL
``localhost:3000/api/v1/transactions/:id``
###### Output
```json
{
  "id": 1,
  "invoice_id": 1,
  "credit_card_number": "4354495077693036",
  "result": "success"
}
```
##
### Customer Endpoints
##### Index
###### Request Url
```
localhost:3000/api/v1/customers
```
###### Output
```json
[
  {
	"id": 1,
	"first_name": "Joey",
	"last_name": "Ondricka"
  },
  {
	"id": 2,
	"first_name": "Cecelia",
	"last_name": "Osinski"
  },
  {
	"id": 3,
	"first_name": "Mariah",
	"last_name": "Toy"
  }
]
```
##### Show
###### Request URL
``localhost:3000/api/v1/customers/:id``
###### Output
```json
{
  "id": 1,
  "first_name": "Joey",
  "last_name": "Ondricka"
}
```
##

### Single Finders

Each data category offers `find` finders to return a single object representation. The finder works with any of the attributes defined on the data type and is case insensitive. 

`Note: All finder examples are represented by Merchant endpoints`

##### Request URL

```
localhost:3000/api/v1/merchants/find?parameters
```

##### Request Parameters


| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the primary key      |
| name       | search based on the name attribute   |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |


##### Request URL

```
localhost:3000/api/v1/merchants/find?name=Schroeder-Jerde
```


#####  Output

```json
{  
   "id":1,
   "name":"Schroeder-Jerde"
}
```
#### Multi-Finders

Each data category offers `find_all` finders which returns all matches for the given query. It works with any of the attributes defined on the data type and is case insensitive.

##### Request URL

```
localhost:3000/api/v1/merchants/find_all?parameters
```

##### Request Parameters

| parameter  | description                          |
|------------|--------------------------------------|
| id         | search based on the primary key      |
| name       | search based on the name attribute   |
| created_at | search based on created_at timestamp |
| updated_at | search based on updated_at timestamp |

##### Request URL
```
localhost:3000/api/v1/merchants/find_all?name=Cummings-Thiel
```
##### Output

```json
[  
   {  
      "id":4,
      "name":"Cummings-Thiel"
   }
]
```

#### Random
Returns a random resource.


##### Request URL

```
localhost:3000/api/v1/merchants/random.json
```
##### Output
```json
{
  "id": 50,
  "name": "Nader-Hyatt"
}
```
##
### Relationship Endpoints

In addition to queries to single resources, relationship data is also available
#### Merchants

* `localhost:3000/api/v1/merchants/:id/items` returns a collection of items associated with that merchant
* `localhost:3000/api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders

#### Invoices

* `localhost:3000/api/v1/invoices/:id/transactions` returns a collection of associated transactions
* `localhost:3000/api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items
* `localhost:3000/api/v1/invoices/:id/items` returns a collection of associated items
* `localhost:3000/api/v1/invoices/:id/customer` returns the associated customer
* `localhost:3000/api/v1/invoices/:id/merchant` returns the associated merchant

#### Invoice Items

* `localhost:3000/api/v1/invoice_items/:id/invoice` returns the associated invoice
* `localhost:3000/api/v1/invoice_items/:id/item` returns the associated item

#### Items

* `localhost:3000/api/v1/items/:id/invoice_items` returns a collection of associated invoice items
* `localhost:3000/api/v1/items/:id/merchant` returns the associated merchant

#### Transactions

* `localhost:3000/api/v1/transactions/:id/invoice` returns the associated invoice

#### Customers

* `localhost:3000/api/v1/customers/:id/invoices` returns a collection of associated invoices
* `localhost:3000/api/v1/customers/:id/transactions` returns a collection of associated transactions

### Business Intelligence Endpoints


#### All Merchants

* `GET /api/v1/merchants/most_revenue?quantity=x` returns the top `x` merchants ranked by total revenue
* `GET /api/v1/merchants/most_items?quantity=x` returns the top `x` merchants ranked by total number of items sold
* `GET /api/v1/merchants/revenue?date=x` returns the total revenue for date `x` across all merchants

Assume the dates provided match the format of a standard ActiveRecord timestamp.

#### Single Merchant

* `localhost:3000/api/v1/merchants/:id/revenue` returns the total revenue for that merchant across all transactions
* `localhost:3000/api/v1/merchants/:id/revenue?date=x` returns the total revenue for that merchant for a specific invoice date `x`
* `localhost:3000/api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions.


#### Items

* `localhost:3000/api/v1/items/most_revenue?quantity=x` returns the top `x` items ranked by total revenue generated
* `localhost:3000/api/v1/items/most_items?quantity=x` returns the top `x` item instances ranked by total number sold

#

[This README is adapted from Turing School Examples Rails Engine](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md)



