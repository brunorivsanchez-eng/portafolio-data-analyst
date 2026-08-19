CREATE TABLE staging_superstore (
    row_id INTEGER,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country_region VARCHAR(100),
    city VARCHAR(100),
    state_province VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales NUMERIC(12,2),
    quantity INTEGER,
    discount NUMERIC(5,2),
    profit NUMERIC(12,2)
);

CREATE TABLE Cliente (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50)
);
CREATE TABLE Producto (
    product_id VARCHAR(20) PRIMARY KEY,
    category VARCHAR(50),
    sub_category VARCHAR(50),
	product_name VARCHAR(100)
);

CREATE TABLE Ubicacion (
    id_ubicacion SERIAL PRIMARY KEY,
    country_region VARCHAR(100),
    city VARCHAR(100),
    state_province VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50)
);

CREATE TABLE Venta (
    row_id INTEGER PRIMARY KEY,
    order_id VARCHAR(50),
    customer_id VARCHAR(20) REFERENCES Cliente(customer_id),
    product_id VARCHAR(20) REFERENCES Producto(product_id),
    id_ubicacion INTEGER REFERENCES Ubicacion(id_ubicacion),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    sales NUMERIC(12,2),
    quantity INTEGER,
    discount NUMERIC(5,2),
    profit NUMERIC(12,2)
);

INSERT INTO Cliente (customer_id, customer_name, segment)
SELECT DISTINCT customer_id, customer_name, segment
FROM staging_superstore;

INSERT INTO Producto (product_id, category, sub_category, product_name)
SELECT DISTINCT product_id, category, sub_category, product_name
FROM staging_superstore;
