create table bizType
(
  id   bigint auto_increment
    primary key,
  name varchar(255) null,
  searchTags varchar (1000) null
);

INSERT INTO db_schema.bizType (id, name, searchTags) VALUES (1,'кафе', 'кафе | рестораны');
INSERT INTO db_schema.bizType (id, name, searchTags) VALUES (2,'аптеки', 'аптека');
INSERT INTO db_schema.bizType (id, name, searchTags) VALUES (3,'салоны красоты', 'салоны красоты | барбер шоп | парикмахерские | спа | маникюр | студия красоты | солярий');
INSERT INTO db_schema.bizType (id, name, searchTags) VALUES (4,'продуктовые магазины', 'магазин | продукты');
INSERT INTO db_schema.bizType (id, name, searchTags) VALUES (5,'магазины одежды', 'одежда');