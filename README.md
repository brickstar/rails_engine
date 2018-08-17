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
## Endpoints

###### ``` *  All references to :id in endpoints should be replaced with an        integer corresponding to the desired record  ```
#### Merchant Endpoints

##### Index
###### Request Url
``localhost:3000/api/v1/merchants``
###### Output
```
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
```
{
  "id":1,
  "name":"Schroeder-Jerde"
}
```
##
##
#### Item Endpoints
##
##
#### Invoice Endpoints
##
##
#### InvoiceItem Endpoints
##
##
#### Transaction Endpoints
##
##
#### Customer Endpoints
##
