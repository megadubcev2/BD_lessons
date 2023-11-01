CREATE TABLE "station_personell" (
  "pers_numb" int PRIMARY KEY,
  "station_id" int,
  "name" varchar
);

CREATE TABLE "patient" (
  "patient_numb" int PRIMARY KEY,
  "disease" varchar,
  "name" varchar,
  "bed_numb" int,
  "doctor_id" int
);

CREATE TABLE "station" (
  "stan_numb" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "doctor" (
  "id" int PRIMARY KEY,
  "area" int,
  "rank" varchar,
  "station_personell_id" int
);

CREATE TABLE "room" (
  "stan_numb" int,
  "room_numb" int PRIMARY KEY
);

CREATE TABLE "bed" (
  "id" int PRIMARY KEY,
  "room_numb" int
);

CREATE TABLE "caregiver" (
  "id" int PRIMARY KEY,
  "station_personell_id" int,
  "qualification" varchar
);

ALTER TABLE "station_personell" ADD FOREIGN KEY ("station_id") REFERENCES "station" ("stan_numb");

ALTER TABLE "caregiver" ADD FOREIGN KEY ("station_personell_id") REFERENCES "station_personell" ("pers_numb");

ALTER TABLE "doctor" ADD FOREIGN KEY ("station_personell_id") REFERENCES "station_personell" ("pers_numb");

ALTER TABLE "patient" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctor" ("id");

ALTER TABLE "patient" ADD FOREIGN KEY ("bed_numb") REFERENCES "bed" ("id");

ALTER TABLE "room" ADD FOREIGN KEY ("stan_numb") REFERENCES "station" ("stan_numb");

ALTER TABLE "bed" ADD FOREIGN KEY ("room_numb") REFERENCES "room" ("room_numb");
