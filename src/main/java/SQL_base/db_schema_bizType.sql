create table bizType
(
  id   bigint auto_increment
    primary key,
  name varchar(255) null
);

INSERT INTO db_schema.bizType (id, name) VALUES (1, 'кафе, рестораны');
INSERT INTO db_schema.bizType (id, name) VALUES (2, 'аптека');
INSERT INTO db_schema.bizType (id, name) VALUES (3, 'салоны красоты, барбер шоп, парикмахерские, спа, маникюр, студия красоты, солярии');
INSERT INTO db_schema.bizType (id, name) VALUES (4, 'магазины продукты');
INSERT INTO db_schema.bizType (id, name) VALUES (5, 'одежда');