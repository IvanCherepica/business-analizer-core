create table biztype
(
  id         bigint auto_increment
    primary key,
  name       varchar(255)  null,
  searchTags varchar(1000) null,
  link       varchar(255)  null
)
  charset = utf8;

INSERT INTO db_schema.biztype (id, name, searchTags, link) VALUES (1, 'Фитнес клуб', 'фитнес клуб', '/exercise_icon.png');
INSERT INTO db_schema.biztype (id, name, searchTags, link) VALUES (2, 'Аптеки', 'аптека', '/drugs_icon.png');
INSERT INTO db_schema.biztype (id, name, searchTags, link) VALUES (3, 'Салоны красоты', 'салон красоты', '/beauty_icon.png');
INSERT INTO db_schema.biztype (id, name, searchTags, link) VALUES (4, 'Продуктовые магазины', 'продукты', '/food_icon.png');
INSERT INTO db_schema.biztype (id, name, searchTags, link) VALUES (5, 'Магазины одежды', 'одежда', '/clothes_icon.png');