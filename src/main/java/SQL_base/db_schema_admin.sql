create table admin
(
  id       bigint auto_increment
    primary key,
  login    varchar(255) null,
  password varchar(255) null
);

INSERT INTO db_schema.admin (id, login, password) VALUES (1, 'root', 'root');