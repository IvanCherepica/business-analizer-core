create table biztype
(
  id         bigint auto_increment
    primary key,
  name       varchar(255)  null,
  searchTags varchar(1000) null
)
  charset = utf8;

INSERT INTO db_schema.biztype (id, name, searchTags, link) VALUES (1, 'Кафе', 'кафе | рестораны', '/cafe_icon.png');
INSERT INTO db_schema.biztype (id, name, searchTags, link) VALUES (2, 'Аптеки', 'аптека', '/drugs_icon.png');
INSERT INTO db_schema.biztype (id, name, searchTags, link) VALUES (3, 'Салоны красоты', 'салоны красоты | барбер шоп | парикмахерские | спа | маникюр | студия красоты | солярий', '/beauty_icon.png');
INSERT INTO db_schema.biztype (id, name, searchTags, link) VALUES (4, 'Продуктовые магазины', 'магазин | продукты', '/food_icon.png');
INSERT INTO db_schema.biztype (id, name, searchTags, link) VALUES (5, 'Магазины одежды', 'одежда', '/clothes_icon.png');