// https://passwordsgenerator.net/

// Criação de usuários ADMIN
use admin;
db.createUser({
  user: "USER_ADMIN",
  pwd: "PASSWORD_ADMIN",
  roles: [ "root",
    { role: "dbOwner", db: "CUSTOM-DB" }
  ]
});

// Criação de usuários R/W
use CUSTOM_DB;
db.createUser({
  user: "CUSTOM_USER",
  pwd: "CUSTOM_PASSWORD",
  roles: [ { role: "readWrite", db: "CUSTOM-DB" } ]
});
