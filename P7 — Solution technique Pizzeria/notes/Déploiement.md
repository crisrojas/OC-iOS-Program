---
title: Déploiement
created: 2022-01-12T21:33:20.782Z
modified: 2022-01-12T21:59:01.835Z
---

# Déploiement



```plantuml
actor Client
actor Staff

frame System {
  database "MySQL Server" as dbserver {
    rectangle "create-db.sql" as dbscript
    database "App database" as appdb
  }
  
  node "Nginx Server" as webserver {

    together group {
      node BackOffice as bo
      node UserDashboard as ud
    }

    artifact "App Backend" as backend
    
  }

}


dbserver - webserver
bo - backend
ud - backend

Client - ud
Staff - bo

dbscript - appdb
@enduml
```
