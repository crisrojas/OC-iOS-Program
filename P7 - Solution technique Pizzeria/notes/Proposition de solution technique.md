---
title: Proposition de solution technique
created: 2021-08-06T15:43:09.112Z
modified: 2021-10-15T08:18:33.770Z
---

<p class="h1">Proposition de solution technique</p>
<p class="h2">IT Consulting & Development</p>


[[@pagebreak]]


| Auteur         | Date       | Description          | Version |
|----------------|------------|----------------------|---------|
| Cristian Rojas | 26/09/2021 | Création du document | 1       |
| Cristian Rojas | 27/09/2021 | Formatage | 1.1       |
| Cristian Rojas | 04/10/2021 | Rédaction finale | 1.2       |

[[@pagebreak]]


[[@toc]]

[[@pagebreak]]

# Proposition de solution technique

## Avant propos

Ce document, rédigé par **« IT Consulting & Development »** et dirigé au groupe  **« OC Pizza »**, constitue une proposition technique dans le cadre de la conception d'un système de gestion permettant de centraliser les commandes des différents points de vente du groupe.

## Rappel du contexte

« OC Pizza » est un jeune groupe de pizzeria en plein essor et spécialisé dans les pizzas livrées ou à emporter.

Comptant 5 points de vente, « OC Pizza »  prévoit d'ouvrir 3 nouveaux dans les prochains 6 mois.

### Besoins

Le groupe « OC Pizza » a exprimé son besoin de mettre en place un système centralisé dans toute ses pizzerias et répondant aux nécessités suivantes:

1. Être plus efficace dans la gestion des commandes, de leur réception à leur livraison en passant par leur préparation?
2. Suivre en temps réel les commandes passées, en préparation et en livraison.
3. Suivre en temps réel le stock d'ingrédients restants pour savoir quelles pizzas peuvent encore être réalisées.
4. Proposer un site Internet pour que les clients puissent
    1. Passer leur commandes
    2. Payer en ligne leur commande s'ils le souhaitent — sinon, ils paieront directement à la livraison.
    3. Modifier ou annuler leur commande tant que celle-ci n'a pas été préparé
5. Proposer un aide mémoire aux pizzaiolos indiquant la recette de chaque pizza

## Proposition

Ayant en compte les démarches du groupe "OZ Pizza" dans la recherche d'une solution pouvant répondre à ses besoins, et ayant nous même constanté ce manque dans les différents logiciels disponibles, "IT Consulting & Development" préconise un solution _custom made_.

Une solution _custom made_ assure une couverture total des besoins du client.

Également, "IT Consulting & Development", ayant développé des _workflows_ et techniques très spécifiques dans ses plus de 20 ans d'expertise dans le domaine, un solution _custom made_ nous permettrait d'être plus efficace dans la phase de développement par opposition à la prise en charge d'une solution pré-fabrique/CMS, qui entraîne inévitablement une période de formation et de lecture de documentation et qui ne garantie pas la couverture totale de toutes les nécessités du client et les enjeux liés (scalabilité entre autres)

#### Backend

Le *backend* est la partie de l'application côté serveur. Il s'agit du coeur de l'application, d'où l'importance de choisir une technologie adéquate dès le début et axée sur la scalabilité, cela permet [d'éviter des migrations futures du _codebase_](https://blog.duolingo.com/rewriting-duolingos-engine-in-scala/)

[Scala](https://www.scala-lang.org/), étant un langage satisfaisant ces besoins, nous proposons son utilisation pour la réalisation du *backend*.

### Frontend

Si le *backend* est le cœur d'une application le *frontend* est la peau.

Nous proposons de réaliser cette partie à l'aide de [Svelte](https://svelte.dev), un jeune framework javascript avec une très belle réception et adoption, permettant de créer des interfaces réactives. 

Svelte facilite:

-  L'écriture des fonctionnalités avec la moindre quantité de code possible, ce qui facilite la maintenance et assure une base de code saine.
- La lisibilité, en utilisant des conventions standards pour la rédaction de ses composants (html, css et js dans leur propres balises au sein d'un même composant) et donc, encore une fois, facilite la maintenance.

### Base de donnés

La "mémoire" de l'application. Elle communique avec le *backend* pour la gestion et récupération des données.

Nous proposons d'utiliser MySQL, un standard très utilisé dans le développement web.

### Mobile

Pour permettre au livreur de modifier le statut de la commande une fois livrée et permettre à l'utilisateur de suivre la livraison de la commande, nous préconisons une application spécifique pour le mobile.

Nous déconseillons donc de rattacher cette fonctionnalité au *frontend* du site web. La raison est que les sites web comportent quelques inconvenants dans les plateformes mobiles par rapport à une application mobile:

- Navigation difficile en comparaison à une application mobile.
- Les langages du web n'ayant pas été conçues pour des interfaces tactiles, éviter des interférences avec le _touch_ peut peut être couteaux en terme de travail, temps et budget.

Nous proposons l'utilisation de [Flutter](https://flutter.dev/?gclsrc=ds&gclsrc=ds), un SDK permettant de réaliser des applications natives pour Android et iOS avec une même base de code, ce qui assure une cohérence dans le rendu entre les différents plateformes et une majeur vitesse de développement et de maintenance.



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

