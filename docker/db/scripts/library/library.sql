CREATE TABLE "reader" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "surname" varchar,
  "adress" varchar,
  "return_date" date,
  "birth_date" date
);

CREATE TABLE "takes" (
  "id" int PRIMARY KEY,
  "book_copy_id" int,
  "reader_number" int
);

CREATE TABLE "book" (
  "isbn" int PRIMARY KEY,
  "year" date,
  "title" varchar,
  "author" varchar,
  "count_of_pages" int,
  "publisher_id" int
);

CREATE TABLE "book_copy" (
  "copy_id" int PRIMARY KEY,
  "book_isbn" int,
  "position" int,
  "category_id" int
);

CREATE TABLE "category" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "parent_cat" varchar
);

CREATE TABLE "publisher" (
  "id" int PRIMARY KEY,
  "adress" varchar,
  "name" varchar
);

ALTER TABLE "takes" ADD FOREIGN KEY ("book_copy_id") REFERENCES "book_copy" ("copy_id");

ALTER TABLE "takes" ADD FOREIGN KEY ("reader_number") REFERENCES "reader" ("id");

ALTER TABLE "book" ADD FOREIGN KEY ("publisher_id") REFERENCES "publisher" ("id");

ALTER TABLE "book_copy" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");

-- Вставка данных в таблицу publisher
INSERT INTO "publisher" ("id", "adress", "name") VALUES
                         (1, 'Адрес издателя 1', 'Издательство 1'),
                         (2, 'Адрес издателя 2', 'Издательство 2');

-- Вставка данных в таблицу category
INSERT INTO "category" ("id", "name", "parent_cat") VALUES
                        (1, 'Категория 1', NULL),
                        (2, 'Категория 2', 'Категория 1'),
                        (3, 'Категория 3', 'Категория 1');

-- Вставка данных в таблицу book
INSERT INTO "book" ("isbn", "year", "title", "author", "count_of_pages", "publisher_id") VALUES
                     (123456789, '2000-01-01', 'Название книги 1', 'Автор 1', 300, 1),
                     (987654321, '1995-01-01', 'Название книги 2', 'Автор 2', 250, 2);

-- Вставка данных в таблицу book_copy
INSERT INTO "book_copy" ("copy_id", "book_isbn", "position", "category_id") VALUES
                        (1, 123456789, 1, 1),
                        (2, 123456789, 2, 2),
                        (3, 987654321, 1, 3);

-- Вставка данных в таблицу reader
INSERT INTO "reader" ("id", "name", "surname", "adress", "return_date", "birth_date") VALUES
                      (1, 'Имя 1', 'Фамилия 1', 'Адрес 1', '2001-01-01', '1980-01-01'),
                      (2, 'Имя 2', 'Фамилия 2', 'Адрес 2', '2002-02-02', '1990-02-02');

-- Вставка данных в таблицу takes
INSERT INTO "takes" ("id", "book_copy_id", "reader_number") VALUES
                    (1, 1, 1),
                    (2, 3, 2);






