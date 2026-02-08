/*
    Database structure for the Bill Pay application
*/

-- Retain the current system statius across restart.
CREATE TABLE System (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    last_type_ID INTEGER NOT NULL
);

-- Transaction types
CREATE TABLE TransType (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    count INTEGER NOT NULL,
    last_date TEXT,
    action INTEGER NOT NULL
    -- notes TEXT
);

-- An actual transaction
CREATE TABLE Trans (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    trans_type_ID INTEGER NOT NULL,
    date TEXT NOT NULL,
    amount REAL NOT NULL,
    committed BOOLEAN NOT NULL
);

-- Account
CREATE TABLE Account (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    amount REAL NOT NULL,
    last_date TEXT,
    priority INTEGER NOT NULL
    -- notes TEXT
);

-- Actions
CREATE TABLE Action (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    description TEXT,
    function TEXT NOT NULL
);

/*
    Default data population for Bill Pay application
*/
INSERT INTO System
        (last_type_ID)
    VALUES
        (1);

INSERT INTO Account
        (name, description, amount, last_date, priority)
    VALUES
        ('PSS', 'Peggy social security for the year', 3408.0, '', 11),
        ('CSS', 'Chuck social security for the year', 32976.0, '', 10),
        ('checking', 'main checking account', 0, '', 0),
        ('payout', 'secondary checking account', 0, '', 1),
        ('savings', 'savings account', 0, '', 2);

INSERT INTO TransType
        (name, description, count, last_date, action)
    VALUES
        ('cpay', 'Chuck payday', 0, '', 1),
        ('ppay', 'Peggy payday', 0, '', 2),
        ('paypal', 'Deposit from PayPal', 0, '', 3),
        ('misc', 'Deposit from an unknown source', 0, '', 4);

INSERT INTO Action
        (function, description)
    VALUES
        ('_do_chuck_pay', ''),
        ('_do_peggy_pay', ''),
        ('_do_pp_pay', ''),
        ('_do_misc_pay', '');

.dump