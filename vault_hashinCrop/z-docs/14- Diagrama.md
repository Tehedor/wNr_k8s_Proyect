[atrás](../README.md)
# Diagrama
Realm: wippe_rebuild
  ├── Clientes:
  │   ├── ids-server 
  │   └── dashboard-backend (API)
  ├── Roles:
  │   ├── admin (acceso total)
  │   └── user (acceso limitado)
  ├── Grupos:
  │   ├── admins → Rol: admin
  │   └── users → Rol: user
  └── Usuarios:
      ├── admin@example.com → Grupo: admins
      └── user1@example.com → Grupo: users