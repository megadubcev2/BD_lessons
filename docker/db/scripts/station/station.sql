CREATE TABLE "station2" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "city_id" int,
  "number_of_tracks" int
);

CREATE TABLE "city" (
  "id" int PRIMARY KEY,
  "region" varchar,
  "name" varchar
);

CREATE TABLE "departure" (
  "id" int PRIMARY KEY,
  "track_id" int,
  "train_numb" int,
  "start" date
);

CREATE TABLE "train" (
  "train_numb" int PRIMARY KEY,
  "length" int
);

CREATE TABLE "arrival" (
  "id" int PRIMARY KEY,
  "track_numb" int,
  "track_id" int,
  "train_numb" int,
  "end" date
);

CREATE TABLE "track" (
  "id" int PRIMARY KEY,
  "station_id" int,
  "number" int
);

ALTER TABLE "arrival" ADD FOREIGN KEY ("train_numb") REFERENCES "train" ("train_numb");

ALTER TABLE "departure" ADD FOREIGN KEY ("track_id") REFERENCES "track" ("id");

ALTER TABLE "station2" ADD FOREIGN KEY ("city_id") REFERENCES "city" ("id");

ALTER TABLE "track" ADD FOREIGN KEY ("station_id") REFERENCES "station2" ("id");

ALTER TABLE "arrival" ADD FOREIGN KEY ("track_id") REFERENCES "track" ("id");

ALTER TABLE "departure" ADD FOREIGN KEY ("train_numb") REFERENCES "train" ("train_numb");
