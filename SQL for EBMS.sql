CREATE  DATABASE EBMS;

CREATE TABLE Failure (
    App_date DATE,
    Sol_date DATE,
    Status VARCHAR(50),
    Description TEXT,
    Cmt_id INT PRIMARY KEY
);

CREATE TABLE Account (
    Acc_No INT PRIMARY KEY,
    F_Name VARCHAR(50),
    M_Name VARCHAR(50),
    I_Name VARCHAR(50)
);

CREATE TABLE Customer (
    Cust_id INT PRIMARY KEY,
    Ph_no VARCHAR(15),
    DOB DATE,
    F_Name VARCHAR(50),
    M_Name VARCHAR(50),
    I_Name VARCHAR(50)
);

CREATE TABLE Customer_Address (
    Cust_id INT,
    Home_No VARCHAR(20),
    State VARCHAR(50),
    City VARCHAR(50),
    Kebele VARCHAR(50),
    FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

CREATE TABLE SMS (
    Sms_Id INT PRIMARY KEY,
    Acc_No INT,
    Bill_No INT,
    Tax DECIMAL(10, 2),
    FOREIGN KEY (Acc_No) REFERENCES Account(Acc_No)
);

CREATE TABLE Tariff (
    Tarif_Id INT PRIMARY KEY,
    Tarif_Desc TEXT,
    Tarif_Type VARCHAR(50)
);

CREATE TABLE Admin (
    Login_Id INT PRIMARY KEY,
    Status VARCHAR(50),
    Name VARCHAR(100),
    Admin_Type VARCHAR(50),
    Password VARCHAR(255)
);

CREATE TABLE Board (
    Board_Id INT PRIMARY KEY,
    B_Type VARCHAR(50),
    Note TEXT,
    Electric_Board VARCHAR(50),
    Tarif_Id INT,
    FOREIGN KEY (Tarif_Id) REFERENCES Tariff(Tarif_Id)
);

CREATE TABLE Billing (
    Bill_No INT PRIMARY KEY,
    Payment_date DATE,
    Record TEXT,
    Status VARCHAR(50),
    Payment_Time TIME,
    Acc_No INT,
    FOREIGN KEY (Acc_No) REFERENCES Account(Acc_No)
);
INSERT INTO Failure (App_date, Sol_date, Status, Description, Cmt_id)
VALUES (
        '2024-03-10',
        '2024-03-12',
        'Resolved',
        'Insufficient funds',
        7001
    ),
    (
        '2024-04-02',
        NULL,
        'Pending',
        'Network error',
        7002
    ),
    (
        '2024-02-25',
        '2024-02-28',
        'Resolved',
        'Meter issue',
        7003
    );

INSERT INTO Account (Acc_No, F_Name, M_Name, I_Name)
VALUES (4001, 'Abebe', 'Kebede', 'Tesfaye'),
    (4002, 'Meron', 'Hailu', 'Girma'),
    (4003, 'Tewodros', 'Solomon', 'Assefa');

INSERT INTO Customer (Cust_id, Ph_no, DOB, F_Name, M_Name, I_Name)
VALUES (
        5001,
        '+251911223344',
        '1985-07-12',
        'Abebe',
        'Kebede',
        'Tesfaye'
    ),
    (
        5002,
        '+251922334455',
        '1990-03-25',
        'Meron',
        'Hailu',
        'Girma'
    ),
    (
        5003,
        '+251933445566',
        '1978-11-05',
        'Tewodros',
        'Solomon',
        'Assefa'
    );

INSERT INTO Customer_Address (Cust_id, Home_No, State, City, Kebele)
VALUES (
        5001,
        'HNo-12',
        'Addis Ababa',
        'Addis Ababa',
        'Kebele 05'
    ),
    (5002, 'HNo-45', 'Oromia', 'Adama', 'Kebele 03'),
    (
        5003,
        'HNo-78',
        'Amhara',
        'Bahir Dar',
        'Kebele 12'
    );

INSERT INTO SMS (Sms_Id, Acc_No, Bill_No, Tax)
VALUES (6001, 4001, 3001, 150.00),
    (6002, 4002, 3002, 200.00),
    (6003, 4003, 3003, 75.50);

INSERT INTO Tariff (Tarif_Id, Tarif_Desc, Tarif_Type)
VALUES (
        201,
        'Basic residential tariff for Addis Ababa',
        'Domestic'
    ),
    (
        202,
        'Industrial tariff for Oromia region',
        'Commercial'
    ),
    (
        203,
        'Subsidized rural tariff for farmers',
        'Agricultural'
    );

INSERT INTO Admin (Login_Id, Status, Name, Admin_Type, Password)
VALUES (
        101,
        'Active',
        'Eskinder Tilahun',
        'Super Admin',
        'eskinder@123'
    ),
    (
        102,
        'Inactive',
        'Selamawit Bekele',
        'Regional Admin',
        'selam#2024'
    ),
    (
        103,
        'Active',
        'Mekonnen Girma',
        'Billing Admin',
        'mekonnen$567'
    );

INSERT INTO Board (Board_Id, B_Type, Note, Electric_Board, Tarif_Id)
VALUES (
        1,
        'Residential',
        'Addis Ababa residential zone',
        'Addis Ababa Electric Utility',
        201
    ),
    (
        2,
        'Commercial',
        'Industrial zone tariff',
        'Oromia Electric Utility',
        202
    ),
    (
        3,
        'Rural',
        'Agricultural zone',
        'Amhara Electric Utility',
        203
    );

INSERT INTO Billing (
        Bill_No,
        Payment_date,
        Record,
        Status,
        Payment_Time,
        Acc_No
    )
VALUES (
        3001,
        '2024-03-15',
        'March 2024 bill',
        'Paid',
        '14:30:00',
        4001
    ),
    (
        3002,
        '2024-04-01',
        'April 2024 bill',
        'Pending',
        NULL,
        4002
    ),
    (
        3003,
        '2024-02-20',
        'February 2024 bill',
        'Paid',
        '10:15:00',
        4003
    );

SELECT *
FROM Failure;
SELECT *
FROM Billing;
SELECT *
FROM Board;
SELECT *
FROM Admin;
SELECT *
FROM Tariff;
SELECT *
FROM Customer_Address;
SELECT *
FROM SMS;
SELECT *
FROM Customer;
SELECT *
FROM Account;

SELECT Billing.Bill_No,
    Billing.Payment_date,
    Account.F_Name,
    Account.I_Name
FROM Billing
    JOIN Account ON Billing.Acc_No = Account.Acc_No;

SELECT Board.Board_Id,
    Board.B_Type,
    Tariff.Tarif_Desc
FROM Board
    JOIN Tariff ON Board.Tarif_Id = Tariff.Tarif_Id;