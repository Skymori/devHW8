create database hw8 with owner postgres;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    user_id     uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
    email       VARCHAR(250) NOT NULL UNIQUE,
    password    VARCHAR(250) NOT NULL,
    first_name  VARCHAR(250) NOT NULL,
    last_name   VARCHAR(250) NOT NULL,
    user_role   VARCHAR(50) NOT NULL
);

CREATE TABLE manufacturers (
    manufacturer_id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
    name            VARCHAR(250) NOT NULL
);

CREATE TABLE products (
    product_id      uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
    name            VARCHAR(250) NOT NULL,
    price           NUMERIC(10,2) NOT NULL,
    manufacturer_id uuid, FOREIGN KEY(manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);
