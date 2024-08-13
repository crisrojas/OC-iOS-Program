---
title: Diagramme de composants
created: 2022-01-06T16:25:21.405Z
modified: 2022-01-13T19:01:12.117Z
---

### Diagramme de composants

> Composant: Ensemble de classes qui représentent un système indépendant capable d'intéragir avec le reste du système

```plantuml
@startuml

package "Gestion du restaurant (Back Office)" {

 
  [Gestion des comptes utilisateur des employés ]
  [Gestion et visualisation de stock]
  [KPI]
  [Gestion de commandes BO]
}

package "Dashboard utilisateur" {
  [Historique des commandes]
  [Gestion de commande]
  [Mon profile (addresses, nom, prénom...)]
  [Gestion de commandes BO] <-- [Gestion de commande]
}

@enduml
```

@todo: Interfacer Auth avec User
```plantuml
[Authentication]
package "AuthenticationOld" {
  [Création de compte]
  [Connexion]
  [Déconnnexion]
}

```

```plantuml
[Gestion de payments]

package "Composant Externes" {
[Paypal]
[Stripe]
[Gestion de payments] --> [Stripe]
[Gestion de payments] --> [Paypal]
}
```


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

