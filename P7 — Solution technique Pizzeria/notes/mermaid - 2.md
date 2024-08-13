---
title: mermaid
created: 2021-11-11T17:09:13.794Z
modified: 2021-12-22T20:27:44.162Z
---

```mermaid
classDiagram

class Pizzeria {
  id: Int
  name: String
  address: Address
}

class ProductStock {
  pizzeria_id: Int
  quantity: Int
  product_id: Int
}

class IngredientStock {
  pizzeria_id: Int
  quantity: Int
  ingredient_id: Int
}

Pizzeria -- ProductStock
Pizzeria -- IngredientStock

class Address {
  street: String
  city: String
  zip_code: Int
}


class User {
id: Int
first_name: String
last_name: String
email: String
password: String
address: Address
}

Pizzeria "1" -- "1" Address
User -- Address

class Client {
billingAddress: Address
}

class Order {
id: Int
client: Client
date: Date
total_price: Double
status: OrderStatus
paid: Bool
products: [Product]
}

Client: + setOrder()
Client: + getOrder()
Client: + updateStatus()

class Product {
id: Int
name: String
priceHistory: [PriceHistory]
}

class OrderStatus {
<<enumeration>>
created
preparing
prepared
delivering
delivered
}

class Pizza {
ingredients: [Ingredient]
}

class Ingredient {
  id: Int
  name: String
}

Product <-- Pizza
Pizza -- Ingredient

Order -- OrderStatus

Order "1..*" -- "1" Product

Client -- Order

class Employee {
  pizzeria_id: Int
  rol: Rol
}

class Rol {
  <<enumeration>>
  owner
  manager
  pizzaiolo
  delivery
}

class PriceHistory {
  price: Double
  date: Date
}

Product -- PriceHistory

Employee -- Rol
Client --> User
Employee --> User

```

