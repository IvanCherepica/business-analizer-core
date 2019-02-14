create table bizType
(
  id   bigint auto_increment
    primary key,
  name varchar(255) null,
  searchTags varchar (1000) null,
  link varchar(20) not null
);

INSERT INTO db_schema.bizType (id,link, name, searchTags) VALUES (1,'cafe','Кафе', 'кафе');
INSERT INTO db_schema.bizType (id,link, name, searchTags) VALUES (2,'pharmacy','Аптеки', 'аптека');
INSERT INTO db_schema.bizType (id,link, name, searchTags) VALUES (3,'beauty','Салоны красоты', 'салоны красоты');
INSERT INTO db_schema.bizType (id,link, name, searchTags) VALUES (4,'food','Продукты', 'продукты');
INSERT INTO db_schema.bizType (id,link, name, searchTags) VALUES (5,'clothes','Одежда', 'одежда');