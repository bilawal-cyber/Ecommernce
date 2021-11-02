USE Ecommerce;

-- avoid using key words

CREATE TABLE Product (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255) NOT NULL,
    prize int
);

CREATE TABLE Buyer (
    ID int IDENTITY(1,1) PRIMARY KEY,
    [Name] varchar(255) NOT NULL,
    Email varchar(255) NOT NULL,
	PhoneNo int NOT NULL
);

CREATE TABLE Buyer_Address (
    ID int IDENTITY(1,1) PRIMARY KEY,
Address varchar(255) NOT NULL,
Status varchar(255) NOT NULL,
);

CREATE TABLE Buyer_Order (
ID int IDENTITY(1,1) PRIMARY KEY,
Buyer_id int NOT NULL,
[time] Datetime,
Address varchar(255) NOT NULL,
Status varchar(255),
FOREIGN KEY (Buyer_id) REFERENCES Buyer(ID)
);

CREATE TABLE Order_products (
ID int IDENTITY(1,1) PRIMARY KEY,
Buyer_Order_id int NOT NULL,
Product_id int NOT NULL,
Price int NOT NULL,
Quantity int NOT NULL,
FOREIGN KEY (Product_id) REFERENCES Product(ID),
FOREIGN KEY (Buyer_Order_id) REFERENCES Buyer_Order(ID)
);

CREATE TABLE Order_Status (
    ID int IDENTITY(1,1) PRIMARY KEY,
Buyer_Order_id int NOT NULL,
[Status] varchar(255) NOT NULL,
[time] Datetime,
    FOREIGN KEY (Buyer_Order_id) REFERENCES Buyer_Order(ID) ON DELETE CASCADE,
);
