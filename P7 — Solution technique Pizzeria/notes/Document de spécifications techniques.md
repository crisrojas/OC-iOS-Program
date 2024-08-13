---
title: Document de spécifications techniques
created: 2022-01-12T20:11:46.709Z
modified: 2022-01-20T18:54:33.124Z
---

<p class="h1">Document de spécifications techniques</p>
<p class="h2">IT Consulting & Development</p>
<p class="h2">OCPizza</p>


[[@pagebreak]]


| Auteur         | Date       | Description        | Version |
| -------------- | ---------- | ------------------ | ------- |
| Cristian Rojas | 18/01/2022 | Début de rédaction | 1       |


[[@pagebreak]]


[[@toc]]

[[@pagebreak]]

## Rappel du contexte

« OC Pizza » est un jeune groupe de pizzeria en plein essor et spécialisé dans les pizzas livrées ou à emporter.

Comptant 5 points de vente, « OC Pizza »  prévoit d'ouvrir 3 nouveaux dans les prochains 6 mois.

## Introduction

Pour faire grandir son modèle de business, le groupe OCPizza souhaite revoir son système numérique afin de répondre aux besoins de gestion nécessaire pour l'ouverture de 3 points de vente.

Le présent document a pour but : 

1. D'apporter les bases techniques d'un tel système en modélisant les différents composants qui le composent.
2. Présenter le domaine fonctionnel du système
3. Les différents composants du système ainsi que les composants externes
4. Les interactions entre les différents composants


## Modélisation du système

### Diagramme de classes

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

### Diagramme de composants

![](component-diagram.png)

### Diagramme de déploiement

![](deployment-diagram.png)



@todo: Vérifier que le script fonctionne!
@todo, @presentation: décrire comment modéliser un array sous forme de table d'association


<style>
.h1 {
  font-weight: bold;
  font-size: 24px;
}
.h2 {
  font-weight: bold;
  font-size: 18
}

@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap');

html, body {
      font-family: "Avenir Next", sans-serif !important;
}

.info-block {
  display:block;
  position: relative;
  background: #FEF3C7;
  padding: 12px;
  padding-left: 32px;
  margin-top: 24px;
}

.info-block::before {
  position: absolute;
  content: "ℹ";
  left: 10px;
}


</style>
