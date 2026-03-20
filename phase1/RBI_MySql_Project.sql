CREATE DATABASE RBI;
USE RBI;
DROP DATABASE RBI;

-- 1. Bank

CREATE TABLE Bank (
    bank_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    branch_code VARCHAR(10) NOT NULL UNIQUE,
    established_year INT CHECK (established_year >= 1800),
    head_office_location VARCHAR(100),
    bank_type VARCHAR(50) DEFAULT 'Commercial',
    ifsc_code VARCHAR(11) UNIQUE NOT NULL,
    swift_code VARCHAR(11),
    contact_email VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE
);

INSERT INTO Bank (bank_id, name, branch_code, established_year, head_office_location, bank_type, ifsc_code, swift_code, contact_email, is_active) VALUES
(1, 'State Bank of India', 'SBI001', 1806, 'Mumbai', 'Public', 'SBIN0000001', 'SBININBBXXX', 'contact@sbi.co.in', TRUE),
(2, 'Punjab National Bank', 'PNB002', 1894, 'New Delhi', 'Public', 'PUNB0000002', 'PUNBINBBXXX', 'support@pnbindia.com', TRUE),
(3, 'HDFC Bank', 'HDFC003', 1994, 'Mumbai', 'Private', 'HDFC0000003', 'HDFCINBBXXX', 'help@hdfcbank.com', TRUE),
(4, 'ICICI Bank', 'ICIC004', 1994, 'Mumbai', 'Private', 'ICIC0000004', 'ICICINBBXXX', 'care@icicibank.com', TRUE),
(5, 'Axis Bank', 'AXIS005', 1993, 'Mumbai', 'Private', 'UTIB0000005', 'AXISINBBXXX', 'info@axisbank.com', TRUE),
(6, 'Bank of Baroda', 'BOB006', 1908, 'Vadodara', 'Public', 'BARB0BOB006', 'BARBINBBXXX', 'customercare@bankofbaroda.com', TRUE),
(7, 'Canara Bank', 'CAN007', 1906, 'Bengaluru', 'Public', 'CNRB0000007', 'CNRBINBBXXX', 'support@canarabank.com', TRUE),
(8, 'Union Bank of India', 'UBI008', 1919, 'Mumbai', 'Public', 'UBIN0000008', 'UBININBBXXX', 'customercare@unionbank.com', TRUE),
(9, 'Kotak Mahindra Bank', 'KMB009', 2003, 'Mumbai', 'Private', 'KKBK0000009', 'KKBKINBBXXX', 'service@kotak.com', TRUE),
(10, 'IndusInd Bank', 'IND010', 1994, 'Mumbai', 'Private', 'INDB0000010', 'INDBINBBXXX', 'contact@indusind.com', TRUE),
(11, 'IDFC First Bank', 'IDFC011', 2015, 'Mumbai', 'Private', 'IDFB0000011', 'IDFBINBBXXX', 'care@idfcfirstbank.com', TRUE),
(12, 'Yes Bank', 'YES012', 2004, 'Mumbai', 'Private', 'YESB0000012', 'YESBINBBXXX', 'help@yesbank.in', TRUE),
(13, 'Central Bank of India', 'CBI013', 1911, 'Mumbai', 'Public', 'CBIN0000013', 'CBININBBXXX', 'support@centralbank.in', TRUE),
(14, 'UCO Bank', 'UCO014', 1943, 'Kolkata', 'Public', 'UCBA0000014', 'UCBAINBBXXX', 'service@ucobank.com', TRUE),
(15, 'Indian Bank', 'IBK015', 1907, 'Chennai', 'Public', 'IDIB0000015', 'IDIBINBBXXX', 'contact@indianbank.in', TRUE),
(16, 'Bank of India', 'BOI016', 1906, 'Mumbai', 'Public', 'BKID0000016', 'BKIDINBBXXX', 'helpdesk@bankofindia.co.in', TRUE),
(17, 'South Indian Bank', 'SIB017', 1929, 'Thrissur', 'Private', 'SIBL0000017', 'SIBLINBBXXX', 'customercare@sib.co.in', TRUE),
(18, 'Karur Vysya Bank', 'KVB018', 1916, 'Karur', 'Private', 'KVBL0000018', 'KVBLINBBXXX', 'care@kvbmail.com', TRUE),
(19, 'Federal Bank', 'FED019', 1931, 'Aluva', 'Private', 'FDRL0000019', 'FDRLINBBXXX', 'support@federalbank.co.in', TRUE),
(20, 'Dhanlaxmi Bank', 'DLX020', 1927, 'Thrissur', 'Private', 'DLXB0000020', 'DLXBINBBXXX', 'info@dhanbank.in', TRUE);

TRUNCATE TABLE Bank;
DROP TABLE Bank;

-- QURIES:
-- 1. Add a new column:
ALTER TABLE Bank
ADD COLUMN total_branches INT;

-- 2. Modify an existing column (e.g., increase length of contact_email):
ALTER TABLE Bank
MODIFY COLUMN contact_email VARCHAR(100);

-- 3. Drop a column (e.g., swift_code):
ALTER TABLE Bank
DROP COLUMN swift_code;

-- 4. Update contact email of a specific bank:
UPDATE Bank
SET contact_email = 'newemail@sbi.co.in'
WHERE bank_id = 1;

-- 5. Set is_active to FALSE for a specific bank:
UPDATE Bank
SET is_active = FALSE
WHERE name = 'Yes Bank';

-- 6. Delete a bank by name:
DELETE FROM Bank
WHERE name = 'Dhanlaxmi Bank';

-- 7. Delete all inactive banks:
DELETE FROM Bank
WHERE is_active = FALSE;

-- 8. Select specific columns:
SELECT name, head_office_location, bank_type FROM Bank;

-- 9. Select banks established before 1950:
SELECT name, established_year FROM Bank
WHERE established_year < 1950;

-- 10. Select private banks in Mumbai:
SELECT * FROM Bank
WHERE bank_type = 'Private' AND head_office_location = 'Mumbai';

-- 11. Count total number of banks:
SELECT COUNT(*) AS total_banks FROM Bank;

-- 12. Count number of public and private banks:
SELECT bank_type, COUNT(*) AS count
FROM Bank
GROUP BY bank_type;

-- 13. Find the oldest bank:
SELECT name, established_year
FROM Bank
ORDER BY established_year ASC
LIMIT 1;

-- 15. Average year of establishment:
SELECT AVG(established_year) AS avg_year FROM Bank;

-- 16. Group by head office location and count:
SELECT head_office_location, COUNT(*) AS banks_in_city
FROM Bank
GROUP BY head_office_location;

-- 17. Locations with more than 2 banks:
SELECT head_office_location, COUNT(*) AS bank_count
FROM Bank
GROUP BY head_office_location
HAVING COUNT(*) > 2;

-- 18. Top 5 most recently established banks:
SELECT name, established_year
FROM Bank
ORDER BY established_year DESC
LIMIT 5;

-- 19. Sort banks alphabetically by name:
SELECT name FROM Bank
ORDER BY name ASC;

-- 2. Customer

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F', 'O')),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE NOT NULL,
    address TEXT,
    aadhar_number CHAR(12) UNIQUE,
    pan_number CHAR(10) UNIQUE,
    is_kyc_verified BOOLEAN DEFAULT FALSE
);

INSERT INTO Customer (customer_id, full_name, date_of_birth, gender, email, phone, address, aadhar_number, pan_number, is_kyc_verified) VALUES
(1, 'Rahul Sharma', '1990-05-12', 'M', 'rahul.sharma@email.com', '9876543210', 'Delhi, India', '123456789012', 'ABCDE1234F', TRUE),
(2, 'Priya Mehta', '1988-08-24', 'F', 'priya.mehta@email.com', '9876543211', 'Mumbai, India', '123456789013', 'ABCDE1235F', TRUE),
(3, 'Amit Verma', '1995-01-15', 'M', 'amit.verma@email.com', '9876543212', 'Kolkata, India', '123456789014', 'ABCDE1236F', FALSE),
(4, 'Sneha Iyer', '1992-03-10', 'F', 'sneha.iyer@email.com', '9876543213', 'Chennai, India', '123456789015', 'ABCDE1237F', TRUE),
(5, 'Arjun Rao', '1987-11-22', 'M', 'arjun.rao@email.com', '9876543214', 'Hyderabad, India', '123456789016', 'ABCDE1238F', TRUE),
(6, 'Ritika Singh', '1993-09-30', 'F', 'ritika.singh@email.com', '9876543215', 'Bengaluru, India', '123456789017', 'ABCDE1239F', FALSE),
(7, 'Karan Patel', '1991-07-17', 'M', 'karan.patel@email.com', '9876543216', 'Ahmedabad, India', '123456789018', 'ABCDE1240F', TRUE),
(8, 'Nisha Das', '1989-04-06', 'F', 'nisha.das@email.com', '9876543217', 'Kolkata, India', '123456789019', 'ABCDE1241F', FALSE),
(9, 'Vikram Joshi', '1996-12-11', 'M', 'vikram.joshi@email.com', '9876543218', 'Pune, India', '123456789020', 'ABCDE1242F', TRUE),
(10, 'Deepa Nair', '1994-06-18', 'F', 'deepa.nair@email.com', '9876543219', 'Trivandrum, India', '123456789021', 'ABCDE1243F', TRUE),
(11, 'Ankit Bansal', '1986-02-14', 'M', 'ankit.bansal@email.com', '9876543220', 'Jaipur, India', '123456789022', 'ABCDE1244F', FALSE),
(12, 'Sanya Kapoor', '1997-10-25', 'F', 'sanya.kapoor@email.com', '9876543221', 'Delhi, India', '123456789023', 'ABCDE1245F', TRUE),
(13, 'Rohan Gupta', '1992-08-05', 'M', 'rohan.gupta@email.com', '9876543222', 'Lucknow, India', '123456789024', 'ABCDE1246F', FALSE),
(14, 'Meera Jain', '1990-03-28', 'F', 'meera.jain@email.com', '9876543223', 'Indore, India', '123456789025', 'ABCDE1247F', TRUE),
(15, 'Dev Mishra', '1993-11-09', 'M', 'dev.mishra@email.com', '9876543224', 'Varanasi, India', '123456789026', 'ABCDE1248F', TRUE),
(16, 'Aisha Khan', '1995-07-01', 'F', 'aisha.khan@email.com', '9876543225', 'Bhopal, India', '123456789027', 'ABCDE1249F', TRUE),
(17, 'Manoj Reddy', '1988-01-03', 'M', 'manoj.reddy@email.com', '9876543226', 'Hyderabad, India', '123456789028', 'ABCDE1250F', FALSE),
(18, 'Tanvi Desai', '1996-09-12', 'F', 'tanvi.desai@email.com', '9876543227', 'Goa, India', '123456789029', 'ABCDE1251F', TRUE),
(19, 'Suresh Kumar', '1985-12-19', 'M', 'suresh.kumar@email.com', '9876543228', 'Ranchi, India', '123456789030', 'ABCDE1252F', FALSE),
(20, 'Lavanya Krishnan', '1991-05-22', 'F', 'lavanya.krishnan@email.com', '9876543229', 'Chennai, India', '123456789031', 'ABCDE1253F', TRUE);

SELECT * FROM Customer;
TRUNCATE TABLE Customer;
DROP TABLE Customer;

-- QURIES:

-- 1. Add a new column: account_open_date
ALTER TABLE Customer
ADD COLUMN account_open_date DATE;

-- 2. Modify data type of phone (e.g., to BIGINT)
ALTER TABLE Customer
MODIFY COLUMN phone BIGINT;

-- 3. Drop a column: pan_number
ALTER TABLE Customer
DROP COLUMN pan_number;

-- 4. Update phone number of a customer:
UPDATE Customer
SET phone = '9999999999'
WHERE customer_id = 1;

-- 5. Mark KYC as verified for unverified customers from "Kolkata":
UPDATE Customer
SET is_kyc_verified = TRUE
WHERE is_kyc_verified = FALSE AND address LIKE '%Kolkata%';

-- 6. Delete customer by ID:
DELETE FROM Customer
WHERE customer_id = 20;

-- 7. Delete all unverified customers:
DELETE FROM Customer
WHERE is_kyc_verified = FALSE;

-- 8. Get all customers:
SELECT * FROM Customer;

-- 9. Select customers from Chennai:
SELECT full_name, email
FROM Customer
WHERE address LIKE '%Chennai%';

-- 10. Select customers born after 1990:
SELECT full_name, date_of_birth
FROM Customer
WHERE date_of_birth > '1990-01-01';

-- 11. Select all unverified customers (KYC = FALSE):
SELECT customer_id, full_name
FROM Customer
WHERE is_kyc_verified = FALSE;

-- 12. Count total number of customers:
SELECT COUNT(*) AS total_customers
FROM Customer;

-- 13. Count of verified vs unverified customers:
SELECT is_kyc_verified, COUNT(*) AS customer_count
FROM Customer
GROUP BY is_kyc_verified;

-- 14. Get average age of customers (using YEAR(CURDATE()) - YEAR(date_of_birth)):
SELECT AVG(YEAR(CURDATE()) - YEAR(date_of_birth)) AS avg_age
FROM Customer;

-- 15. Find youngest and oldest customer:
SELECT full_name, date_of_birth
FROM Customer
ORDER BY date_of_birth ASC
LIMIT 1;  -- oldest

SELECT full_name, date_of_birth
FROM Customer
ORDER BY date_of_birth DESC
LIMIT 1;  -- youngest

-- 16. Group customers by city (from address):
SELECT SUBSTRING_INDEX(address, ',', 1) AS city, COUNT(*) AS customer_count
FROM Customer
GROUP BY city;

-- 17. Cities with more than 1 customer:
SELECT SUBSTRING_INDEX(address, ',', 1) AS city, COUNT(*) AS count
FROM Customer
GROUP BY city
HAVING COUNT(*) > 1;

-- 18. Sort customers by date of birth (youngest first):
SELECT full_name, date_of_birth
FROM Customer
ORDER BY date_of_birth DESC;

-- 19. Limit to first 5 female customers:
SELECT full_name, gender
FROM Customer
WHERE gender = 'F'
LIMIT 5;



-- 3. Account
CREATE TABLE Account (
    account_id INT PRIMARY KEY,
    customer_id INT,
    bank_id INT,
    account_type VARCHAR(20) CHECK (account_type IN ('Savings', 'Current', 'FD')),
    opened_date DATE ,
    balance DECIMAL(15,2) DEFAULT 0.0 CHECK (balance >= 0),
    is_active BOOLEAN DEFAULT TRUE,
    interest_rate DECIMAL(5,2),
    currency VARCHAR(3) DEFAULT 'INR',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (bank_id) REFERENCES Bank(bank_id)
);

INSERT INTO Account (account_id, customer_id, bank_id, account_type, opened_date, balance, is_active, interest_rate, currency) VALUES
(1, 1, 1, 'Savings', '2020-01-15', 12000.50, TRUE, 3.50, 'INR'),
(2, 2, 2, 'Current', '2019-06-10', 250000.00, TRUE, 0.00, 'INR'),
(3, 3, 3, 'FD', '2021-11-05', 100000.00, TRUE, 6.75, 'INR'),
(4, 4, 4, 'Savings', '2023-02-20', 5000.00, TRUE, 3.00, 'INR'),
(5, 5, 5, 'Current', '2018-08-30', 750000.00, FALSE, 0.00, 'INR'),
(6, 6, 6, 'FD', '2022-07-01', 200000.00, TRUE, 7.00, 'INR'),
(7, 7, 7, 'Savings', '2020-12-12', 15000.25, TRUE, 3.25, 'INR'),
(8, 8, 8, 'Current', '2017-03-15', 500000.00, FALSE, 0.00, 'USD'),
(9, 9, 9, 'FD', '2021-09-09', 300000.00, TRUE, 6.50, 'INR'),
(10, 10, 10, 'Savings', '2022-01-01', 8000.00, TRUE, 3.10, 'INR'),
(11, 11, 11, 'Current', '2020-10-10', 1000000.00, TRUE, 0.00, 'INR'),
(12, 12, 12, 'FD', '2019-12-01', 150000.00, TRUE, 6.90, 'USD'),
(13, 13, 13, 'Savings', '2021-05-05', 4500.00, TRUE, 2.75, 'INR'),
(14, 14, 14, 'Current', '2023-06-20', 125000.00, TRUE, 0.00, 'INR'),
(15, 15, 15, 'FD', '2020-03-03', 250000.00, TRUE, 7.10, 'INR'),
(16, 16, 16, 'Savings', '2018-09-09', 3000.00, TRUE, 2.90, 'INR'),
(17, 17, 17, 'Current', '2016-01-01', 600000.00, FALSE, 0.00, 'USD'),
(18, 18, 18, 'FD', '2021-08-15', 400000.00, TRUE, 6.80, 'INR'),
(19, 19, 19, 'Savings', '2023-04-10', 9500.00, TRUE, 3.20, 'INR'),
(20, 20, 20, 'Current', '2017-11-11', 180000.00, TRUE, 0.00, 'INR');

SELECT * FROM Account;
TRUNCATE TABLE Account;
DROP TABLE Account;

-- QURIES:

-- 1. Add a column for account status description:
ALTER TABLE Account
ADD COLUMN status_description VARCHAR(50);

-- 2. Modify the interest_rate to allow more precision:
ALTER TABLE Account
MODIFY COLUMN interest_rate DECIMAL(5,2);

-- 3. Drop the currency column:
ALTER TABLE Account
DROP COLUMN currency;

-- 4. Update balance of a specific account:
UPDATE Account
SET balance = 15000.75
WHERE account_id = 1;

-- 5. Set inactive for FD accounts older than 3 years:
UPDATE Account
SET is_active = FALSE
WHERE account_type = 'FD' AND opened_date < '2022-08-24';

-- 6. Update interest rate for all savings accounts to 3.75%:
UPDATE Account
SET interest_rate = 3.75
WHERE account_type = 'Savings';

-- 7. Delete account with zero balance:
DELETE FROM Account
WHERE balance = 0;

-- 8. Delete all inactive current accounts:
DELETE FROM Account
WHERE account_type = 'Current' AND is_active = FALSE;

-- 9. Select FD accounts with balance above ₹200,000:
SELECT account_id, customer_id, balance
FROM Account
WHERE account_type = 'FD' AND balance > 200000;

-- 10. Select all active savings accounts sorted by balance descending:
SELECT account_id, balance
FROM Account
WHERE account_type = 'Savings' AND is_active = TRUE
ORDER BY balance DESC;

-- 11. Total number of accounts:
SELECT COUNT(*) AS total_accounts
FROM Account;

-- 12. Average balance by account type:
SELECT account_type, AVG(balance) AS avg_balance
FROM Account
GROUP BY account_type;

-- 13. Total balance per currency:
SELECT currency, SUM(balance) AS total_balance
FROM Account
GROUP BY currency;

-- 14. Max and Min interest rate:
SELECT MAX(interest_rate) AS max_rate, MIN(interest_rate) AS min_rate
FROM Account;

-- 15. Number of accounts per account type:
SELECT account_type, COUNT(*) AS count
FROM Account
GROUP BY account_type;

-- 16. Show only account types with more than 5 accounts:
SELECT account_type, COUNT(*) AS count
FROM Account
GROUP BY account_type
HAVING COUNT(*) > 5;

-- 17. Top 5 accounts by balance:
SELECT account_id, customer_id, balance
FROM Account
ORDER BY balance DESC
LIMIT 5;

-- 18. Average interest rate per account type, only where the average is greater than 3.0:
SELECT account_type, AVG(interest_rate) AS avg_rate
FROM Account
GROUP BY account_type
HAVING AVG(interest_rate) > 3.0;

-- 19. Calculate how many years old each account is:
SELECT account_id, 
       opened_date,
       TIMESTAMPDIFF(YEAR, opened_date, CURDATE()) AS account_age_years
FROM Account;

-- 4. Transaction
CREATE TABLE Transaction (
    transaction_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    amount DECIMAL(15,2) CHECK (amount > 0),
    transaction_type VARCHAR(10) CHECK (transaction_type IN ('Credit', 'Debit')),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mode VARCHAR(20),
    status VARCHAR(10) DEFAULT 'Pending',
    reference_id VARCHAR(50),
    remarks TEXT,
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

INSERT INTO Transaction (transaction_id, account_id, amount, transaction_type, mode, status, reference_id, remarks) VALUES
(1, 1, 5000.00, 'Credit', 'NEFT', 'Success', 'TXN10001', 'Salary Credit'),
(2, 2, 1500.00, 'Debit', 'ATM', 'Success', 'TXN10002', 'ATM Withdrawal'),
(3, 3, 10000.00, 'Credit', 'RTGS', 'Success', 'TXN10003', 'FD Maturity Credit'),
(4, 4, 2000.00, 'Debit', 'UPI', 'Success', 'TXN10004', 'Grocery Shopping'),
(5, 5, 75000.00, 'Credit', 'Cheque', 'Pending', 'TXN10005', 'Client Payment'),
(6, 6, 5000.00, 'Debit', 'IMPS', 'Success', 'TXN10006', 'Rent Transfer'),
(7, 7, 12000.00, 'Credit', 'UPI', 'Success', 'TXN10007', 'Refund from Flipkart'),
(8, 8, 3500.00, 'Debit', 'ATM', 'Failed', 'TXN10008', 'ATM Failed Withdrawal'),
(9, 9, 20000.00, 'Credit', 'NEFT', 'Success', 'TXN10009', 'Loan Disbursement'),
(10, 10, 4500.00, 'Debit', 'POS', 'Success', 'TXN10010', 'Electronics Purchase'),
(11, 11, 70000.00, 'Credit', 'RTGS', 'Success', 'TXN10011', 'Salary Transfer'),
(12, 12, 6000.00, 'Debit', 'IMPS', 'Pending', 'TXN10012', 'Transfer to Friend'),
(13, 13, 800.00, 'Debit', 'UPI', 'Success', 'TXN10013', 'Coffee Shop'),
(14, 14, 500.00, 'Credit', 'Cash Deposit', 'Success', 'TXN10014', 'Cash Deposit at Branch'),
(15, 15, 3000.00, 'Debit', 'Cheque', 'Success', 'TXN10015', 'Rent Payment'),
(16, 16, 9500.00, 'Credit', 'IMPS', 'Success', 'TXN10016', 'Freelance Payment'),
(17, 17, 15000.00, 'Debit', 'NEFT', 'Success', 'TXN10017', 'Office Supplies'),
(18, 18, 1000.00, 'Credit', 'UPI', 'Success', 'TXN10018', 'Mobile Recharge'),
(19, 19, 2500.00, 'Debit', 'POS', 'Success', 'TXN10019', 'Restaurant Bill'),
(20, 20, 20000.00, 'Credit', 'RTGS', 'Success', 'TXN10020', 'Dividend Payout');

SELECT * FROM Transaction;
TRUNCATE TABLE Transaction ;
DROP TABLE Transaction ;

-- QURIES:

-- 1. Add a transaction_date column:
ALTER TABLE Transaction
ADD COLUMN transaction_date DATE;

-- 2. Modify amount to increase precision:
ALTER TABLE Transaction
MODIFY COLUMN amount DECIMAL(12,2);

-- 3. Drop remarks column (if no longer needed):
ALTER TABLE Transaction
DROP COLUMN remarks;

-- 4. Mark a pending transaction as success:
UPDATE Transaction
SET status = 'Success'
WHERE transaction_id = 5;

-- 5. Update reference ID of a failed transaction:
UPDATE Transaction
SET reference_id = 'TXN10008_CORRECTED'
WHERE transaction_id = 8;

-- 6. Delete failed transactions:
DELETE FROM Transaction
WHERE status = 'Failed';

-- 7. Delete transactions below ₹500:
DELETE FROM Transaction
WHERE amount < 500;

-- 8. Get all credit transactions above ₹10,000:
SELECT transaction_id, amount, mode
FROM Transaction
WHERE transaction_type = 'Credit' AND amount > 10000;

-- 8. Find transactions that are still pending:
SELECT *
FROM Transaction
WHERE status = 'Pending';

-- 9. Total number of transactions:
SELECT COUNT(*) AS total_transactions
FROM Transaction;

-- 10. Total amount transacted (Credit and Debit separately):
SELECT transaction_type, SUM(amount) AS total_amount
FROM Transaction
GROUP BY transaction_type;

-- 11. Average transaction amount per mode:
SELECT mode, AVG(amount) AS average_amount
FROM Transaction
GROUP BY mode;

-- 12. Maximum transaction amount:
SELECT MAX(amount) AS max_transaction_amount
FROM Transaction;

-- 13. Count transactions by mode:
SELECT mode, COUNT(*) AS count_by_mode
FROM Transaction
GROUP BY mode;

-- 14. Find modes with more than 2 transactions:
SELECT mode, COUNT(*) AS mode_count
FROM Transaction
GROUP BY mode
HAVING COUNT(*) > 2;

-- 15. Top 5 highest transactions:
SELECT transaction_id, amount, transaction_type
FROM Transaction
ORDER BY amount DESC
LIMIT 5;

-- 16. Get all transactions ordered by type and then by amount:
SELECT *
FROM Transaction
ORDER BY transaction_type ASC, amount DESC;

 -- 17. Add random dates for demonstration:
UPDATE Transaction
SET transaction_date = DATE_ADD('2023-01-01', INTERVAL transaction_id DAY);

-- 18 .Filter transactions in 2023:
SELECT *
FROM Transaction
WHERE YEAR(transaction_date) = 2023;


-- 5. Employee
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    bank_id INT,
    full_name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    date_joined DATE,
    salary DECIMAL(10,2) CHECK (salary >= 0),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (bank_id) REFERENCES Bank(bank_id)
);

INSERT INTO Employee (employee_id, bank_id, full_name, position, date_joined, salary, email, phone, is_active) VALUES
(1, 1, 'Ramesh Iyer', 'Branch Manager', '2015-06-10', 95000.00, 'ramesh.iyer@sbi.com', '9876000001', TRUE),
(2, 2, 'Pooja Shah', 'Clerk', '2018-04-15', 32000.00, 'pooja.shah@pnb.com', '9876000002', TRUE),
(3, 3, 'Anil Kapoor', 'Loan Officer', '2019-01-20', 45000.00, 'anil.kapoor@hdfc.com', '9876000003', TRUE),
(4, 4, 'Divya Nair', 'IT Officer', '2020-09-05', 55000.00, 'divya.nair@icici.com', '9876000004', TRUE),
(5, 5, 'Sanjay Gupta', 'Security Officer', '2014-11-12', 38000.00, 'sanjay.gupta@axis.com', '9876000005', TRUE),
(6, 6, 'Meenal Deshmukh', 'HR Executive', '2017-07-22', 60000.00, 'meenal.deshmukh@bob.com', '9876000006', TRUE),
(7, 7, 'Ashok Kumar', 'Cashier', '2021-03-01', 28000.00, 'ashok.kumar@canarabank.com', '9876000007', TRUE),
(8, 8, 'Seema Rathi', 'Assistant Manager', '2016-08-17', 72000.00, 'seema.rathi@unionbank.com', '9876000008', TRUE),
(9, 9, 'Vikram Sinha', 'Relationship Manager', '2022-05-10', 50000.00, 'vikram.sinha@kotak.com', '9876000009', TRUE),
(10, 10, 'Tina Fernandes', 'Customer Support', '2020-12-01', 34000.00, 'tina.fernandes@indusind.com', '9876000010', TRUE),
(11, 11, 'Nitin Patil', 'Marketing Officer', '2018-06-15', 41000.00, 'nitin.patil@idfc.com', '9876000011', TRUE),
(12, 12, 'Kavya Shetty', 'Operations Executive', '2019-09-30', 46000.00, 'kavya.shetty@yesbank.com', '9876000012', TRUE),
(13, 13, 'Pranav Dubey', 'Clerk', '2017-04-11', 31000.00, 'pranav.dubey@cbi.com', '9876000013', TRUE),
(14, 14, 'Anita Rao', 'Audit Officer', '2016-02-18', 58000.00, 'anita.rao@uco.com', '9876000014', TRUE),
(15, 15, 'Ravi Krishnan', 'Manager', '2013-10-22', 87000.00, 'ravi.krishnan@indianbank.com', '9876000015', TRUE),
(16, 16, 'Shalini Kapoor', 'Legal Advisor', '2015-01-10', 69000.00, 'shalini.kapoor@boi.com', '9876000016', TRUE),
(17, 17, 'Farhan Qureshi', 'Cashier', '2021-11-09', 27000.00, 'farhan.qureshi@sib.com', '9876000017', TRUE),
(18, 18, 'Aarav Nanda', 'Branch Manager', '2012-05-16', 92000.00, 'aarav.nanda@kvb.com', '9876000018', TRUE),
(19, 19, 'Neha Bhatt', 'Compliance Officer', '2020-07-07', 63000.00, 'neha.bhatt@federal.com', '9876000019', TRUE),
(20, 20, 'Manish Sharma', 'Data Analyst', '2023-02-25', 57000.00, 'manish.sharma@dhanbank.com', '9876000020', TRUE);

SELECT * FROM  Employee;
TRUNCATE TABLE Employee;
DROP TABLE Employee;

-- QURIES :

-- 1. Get names and positions of all employees
SELECT full_name, position FROM Employee;

-- 2. List employees who are Cashiers
SELECT * FROM Employee WHERE position = 'Cashier';

-- 3. Employees with salary more than ₹50,000
SELECT * FROM Employee WHERE salary > 50000;

-- 4. Employees who joined after 2020
SELECT * FROM Employee WHERE date_joined > '2020-01-01';

-- 5. Show email and phone of all employees
SELECT full_name, email, phone FROM Employee;

-- 6. Employees working in Bank ID 1 (e.g., SBI)
SELECT * FROM Employee WHERE bank_id = 1;

-- 7. Show salaries in descending order
SELECT full_name, salary FROM Employee ORDER BY salary DESC;

-- 8. Highest paid employee
SELECT * FROM Employee ORDER BY salary DESC LIMIT 1;

-- 9. Lowest paid employee
SELECT * FROM Employee ORDER BY salary ASC LIMIT 1;

-- 10. Count of all employees
SELECT COUNT(*) AS total_employees FROM Employee;

-- 11. Average salary
SELECT AVG(salary) AS average_salary FROM Employee;

-- 12. Count employees per bank
SELECT bank_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY bank_id;

-- 13. Total salary paid by each bank
SELECT bank_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY bank_id;

-- 14. Count of employees by position
SELECT position, COUNT(*) AS count_by_position
FROM Employee
GROUP BY position;

-- 15. Employees whose name starts with 'R'
SELECT * FROM Employee WHERE full_name LIKE 'R%';

-- 16. Show how many years each employee has worked
SELECT full_name, 
       TIMESTAMPDIFF(YEAR, date_joined, CURDATE()) AS years_worked
FROM Employee;

-- 17. List only active employees
SELECT * FROM Employee WHERE is_active = TRUE;

-- 18. Show email domains of all employees
SELECT full_name, SUBSTRING_INDEX(email, '@', -1) AS email_domain
FROM Employee;

-- 19. Top 5 highest paid employees
SELECT full_name, position, salary
FROM Employee
ORDER BY salary DESC
LIMIT 5;

-- 6. Branch
CREATE TABLE Branch (
    branch_id INT PRIMARY KEY,
    bank_id INT NOT NULL,
    name VARCHAR(100),
    code VARCHAR(10) UNIQUE NOT NULL,
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50) DEFAULT 'India',
    contact_number VARCHAR(15),
    FOREIGN KEY (bank_id) REFERENCES Bank(bank_id)
);

INSERT INTO Branch (branch_id, bank_id, name, code, address, city, state, country, contact_number) VALUES
(1, 1, 'SBI Main Branch', 'SBI001', 'MG Road, Fort', 'Mumbai', 'Maharashtra', 'India', '02212345601'),
(2, 2, 'PNB Civil Lines', 'PNB002', 'Civil Lines', 'Delhi', 'Delhi', 'India', '01112345602'),
(3, 3, 'HDFC Koramangala', 'HDFC003', 'Koramangala 1st Block', 'Bengaluru', 'Karnataka', 'India', '08012345603'),
(4, 4, 'ICICI Park Street', 'ICIC004', 'Park Street', 'Kolkata', 'West Bengal', 'India', '03312345604'),
(5, 5, 'Axis Jubilee Hills', 'AXIS005', 'Jubilee Hills', 'Hyderabad', 'Telangana', 'India', '04012345605'),
(6, 6, 'BOB Alkapuri', 'BOB006', 'Alkapuri Road', 'Vadodara', 'Gujarat', 'India', '026512345606'),
(7, 7, 'Canara Indiranagar', 'CAN007', 'Indiranagar', 'Bengaluru', 'Karnataka', 'India', '08012345607'),
(8, 8, 'UBI Andheri', 'UBI008', 'Andheri East', 'Mumbai', 'Maharashtra', 'India', '02212345608'),
(9, 9, 'Kotak MG Road', 'KMB009', 'MG Road Branch', 'Pune', 'Maharashtra', 'India', '02012345609'),
(10, 10, 'IndusInd T Nagar', 'IND010', 'T Nagar', 'Chennai', 'Tamil Nadu', 'India', '04412345610'),
(11, 11, 'IDFC Gachibowli', 'IDFC011', 'Gachibowli', 'Hyderabad', 'Telangana', 'India', '04012345611'),
(12, 12, 'Yes Bank Connaught', 'YES012', 'Connaught Place', 'Delhi', 'Delhi', 'India', '01112345612'),
(13, 13, 'CBI Chowringhee', 'CBI013', 'Chowringhee Road', 'Kolkata', 'West Bengal', 'India', '03312345613'),
(14, 14, 'UCO Bistupur', 'UCO014', 'Bistupur Market', 'Jamshedpur', 'Jharkhand', 'India', '065712345614'),
(15, 15, 'Indian Bank Anna Nagar', 'IBK015', 'Anna Nagar', 'Chennai', 'Tamil Nadu', 'India', '04412345615'),
(16, 16, 'BOI Lalbagh', 'BOI016', 'Lalbagh Road', 'Lucknow', 'Uttar Pradesh', 'India', '052212345616'),
(17, 17, 'SIB MG Road', 'SIB017', 'MG Road Branch', 'Thrissur', 'Kerala', 'India', '048712345617'),
(18, 18, 'KVB Race Course', 'KVB018', 'Race Course', 'Coimbatore', 'Tamil Nadu', 'India', '042212345618'),
(19, 19, 'Federal Kakkanad', 'FED019', 'Infopark Road', 'Kochi', 'Kerala', 'India', '048412345619'),
(20, 20, 'Dhanlaxmi Palakkad', 'DLX020', 'Palakkad Town', 'Palakkad', 'Kerala', 'India', '04912345620');

TRUNCATE TABLE Branch ;
DROP TABLE Branch ;

-- QURIES:

-- 1. Get all branch records:
SELECT * FROM Branch;

-- 2. Show branch names and cities:
SELECT name, city FROM Branch;

-- 3. List branches in Maharashtra:
SELECT * FROM Branch WHERE state = 'Maharashtra';

-- 4. List branches in Tamil Nadu:
SELECT * FROM Branch WHERE state = 'Tamil Nadu';

-- 5. Show branches sorted by city:
SELECT * FROM Branch ORDER BY city;

-- 6. Find branches located in Chennai:
SELECT * FROM Branch WHERE city = 'Chennai';

-- 7. List branches where the contact number starts with '044':
SELECT * FROM Branch WHERE contact_number LIKE '044%';

-- 8. Count branches by state:
SELECT state, COUNT(*) AS total_branches
FROM Branch
GROUP BY state;

-- 9. Get the number of branches in Karnataka:
SELECT COUNT(*) AS karnataka_branches 
FROM Branch 
WHERE state = 'Karnataka';

-- 10. Find the branch with the longest name:
SELECT * FROM Branch
ORDER BY LENGTH(name) DESC
LIMIT 1;

-- 11. Update the contact number for Branch ID 1:
UPDATE Branch
SET contact_number = '02299999999'
WHERE branch_id = 1;

-- 12. Change the city of Branch ID 5 to 'Secunderabad':
UPDATE Branch
SET city = 'Secunderabad'
WHERE branch_id = 5;

-- 13. Update address of all Chennai branches:
UPDATE Branch
SET address = 'Updated Chennai Address'
WHERE city = 'Chennai';

-- 14. Delete the branch with ID 20:
DELETE FROM Branch
WHERE branch_id = 20;

-- 15. Delete all branches in Kerala:
DELETE FROM Branch
WHERE state = 'Kerala';

-- 16. Add a new column for branch opening date:
ALTER TABLE Branch
ADD opening_date DATE;

-- 17. Add a column for branch manager name:
ALTER TABLE Branch
ADD manager_name VARCHAR(100);

-- 18. Rename column contact_number to phone_number:
ALTER TABLE Branch
RENAME COLUMN contact_number TO phone_number;

-- 19. Change the data type of code to VARCHAR(20):
ALTER TABLE Branch
MODIFY code VARCHAR(20);

-- 20. Drop the country column:
ALTER TABLE Branch
DROP COLUMN country;


-- 7. Loan
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    loan_type VARCHAR(50),
    amount DECIMAL(15,2) CHECK (amount > 0),
    interest_rate DECIMAL(5,2),
    tenure_months INT CHECK (tenure_months > 0),
    start_date DATE,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

INSERT INTO Loan (loan_id, customer_id, branch_id, loan_type, amount, interest_rate, tenure_months, start_date, status) VALUES
(1, 1, 1, 'Home Loan', 2500000.00, 7.50, 240, '2022-01-10', 'Approved'),
(2, 2, 2, 'Personal Loan', 500000.00, 11.00, 60, '2023-03-15', 'Approved'),
(3, 3, 3, 'Education Loan', 800000.00, 9.25, 84, '2021-08-01', 'Disbursed'),
(4, 4, 4, 'Car Loan', 600000.00, 8.00, 48, '2023-06-10', 'Pending'),
(5, 5, 5, 'Gold Loan', 200000.00, 10.50, 24, '2022-11-05', 'Approved'),
(6, 6, 6, 'Business Loan', 1500000.00, 12.00, 72, '2021-01-20', 'Rejected'),
(7, 7, 7, 'Home Loan', 3000000.00, 7.25, 180, '2020-07-12', 'Disbursed'),
(8, 8, 8, 'Personal Loan', 450000.00, 10.75, 36, '2022-09-09', 'Approved'),
(9, 9, 9, 'Car Loan', 700000.00, 8.25, 60, '2023-01-17', 'Approved'),
(10, 10, 10, 'Education Loan', 650000.00, 9.00, 96, '2021-06-30', 'Pending'),
(11, 11, 11, 'Business Loan', 2000000.00, 11.50, 60, '2022-03-12', 'Approved'),
(12, 12, 12, 'Home Loan', 2800000.00, 7.75, 240, '2020-02-02', 'Disbursed'),
(13, 13, 13, 'Gold Loan', 180000.00, 10.00, 12, '2023-04-14', 'Approved'),
(14, 14, 14, 'Personal Loan', 300000.00, 11.25, 48, '2022-05-18', 'Pending'),
(15, 15, 15, 'Car Loan', 800000.00, 8.50, 48, '2021-09-21', 'Disbursed'),
(16, 16, 16, 'Business Loan', 1000000.00, 12.25, 36, '2023-07-01', 'Approved'),
(17, 17, 17, 'Home Loan', 2200000.00, 7.80, 180, '2020-10-11', 'Disbursed'),
(18, 18, 18, 'Education Loan', 900000.00, 9.10, 84, '2022-12-25', 'Approved'),
(19, 19, 19, 'Gold Loan', 250000.00, 10.75, 18, '2023-08-05', 'Pending'),
(20, 20, 20, 'Personal Loan', 350000.00, 11.00, 36, '2021-03-27', 'Rejected');


TRUNCATE TABLE Loan;
DROP TABLE Loan;

-- QURIES:

-- 1. Show all loans:
SELECT * FROM Loan;

-- 2. Get only customer_id, loan_type and amount:
SELECT customer_id, loan_type, amount FROM Loan;

-- 3. Find all approved loans:
SELECT * FROM Loan WHERE status = 'Approved';

-- 4. List loans above ₹1,000,000:
SELECT * FROM Loan WHERE amount > 1000000;

-- 5. Get loans with interest rate above 10%:
SELECT * FROM Loan WHERE interest_rate > 10;

-- 6. Show loans ordered by amount (highest first):
SELECT * FROM Loan ORDER BY amount DESC;

-- 7. List personal loans only:
SELECT * FROM Loan WHERE loan_type = 'Personal Loan';

-- 8. Count number of loans by type:
SELECT loan_type, COUNT(*) AS total FROM Loan GROUP BY loan_type;

-- 9. Get average interest rate for each loan type:
SELECT loan_type, AVG(interest_rate) AS avg_interest 
FROM Loan 
GROUP BY loan_type;

-- 10. Show loan types with more than 3 applications:
SELECT loan_type, COUNT(*) AS count 
FROM Loan 
GROUP BY loan_type 
HAVING COUNT(*) > 3;

-- 11. Update loan status to 'Disbursed' for Loan ID 4:
UPDATE Loan 
SET status = 'Disbursed' 
WHERE loan_id = 4;

-- 12. Increase interest rate of rejected loans by 0.5%:
UPDATE Loan 
SET interest_rate = interest_rate + 0.5 
WHERE status = 'Rejected';

-- 13. Change loan_type from 'Gold Loan' to 'Secured Loan':
UPDATE Loan 
SET loan_type = 'Secured Loan' 
WHERE loan_type = 'Gold Loan';

-- 14. Delete loans with status 'Rejected':
DELETE FROM Loan 
WHERE status = 'Rejected';

-- 15. Delete all loans below ₹200,000:
DELETE FROM Loan 
WHERE amount < 200000;

-- 16. Add a new column for EMI (Monthly Payment):
ALTER TABLE Loan 
ADD emi_amount DECIMAL(10,2);

-- 17. Add a column to mark if the loan is secured:
ALTER TABLE Loan 
ADD is_secured BOOLEAN DEFAULT FALSE;

-- 18. Change data type of status to VARCHAR(20):
ALTER TABLE Loan 
MODIFY status VARCHAR(20);

-- 19. Rename column tenure_months to duration_months:
ALTER TABLE Loan 
RENAME COLUMN tenure_months TO duration_months;

-- 20. Drop the start_date column (⚠️ use cautiously):
ALTER TABLE Loan 
DROP COLUMN start_date;


-- 8. Loan_Payment
CREATE TABLE Loan_Payment (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_date DATE ,
    amount_paid DECIMAL(15,2) CHECK (amount_paid > 0),
    mode_of_payment VARCHAR(20),
    receipt_number VARCHAR(50) UNIQUE,
    status VARCHAR(20),
    remarks TEXT,
    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id)
);

INSERT INTO Loan_Payment (payment_id, loan_id, payment_date, amount_paid, mode_of_payment, receipt_number, status, remarks) VALUES
(1, 1, '2023-02-10', 15000.00, 'NEFT', 'RCP001', 'Success', 'First EMI'),
(2, 2, '2023-04-15', 10000.00, 'UPI', 'RCP002', 'Success', 'First installment'),
(3, 3, '2022-01-01', 12000.00, 'IMPS', 'RCP003', 'Success', 'Monthly repayment'),
(4, 4, '2023-07-01', 13000.00, 'Cash', 'RCP004', 'Pending', 'Due to approval'),
(5, 5, '2023-01-20', 5000.00, 'Cheque', 'RCP005', 'Success', 'Part payment'),
(6, 6, '2021-02-15', 25000.00, 'RTGS', 'RCP006', 'Failed', 'Insufficient balance'),
(7, 7, '2022-10-10', 20000.00, 'UPI', 'RCP007', 'Success', 'Quarterly EMI'),
(8, 8, '2023-03-10', 9000.00, 'Cash', 'RCP008', 'Success', 'Timely payment'),
(9, 9, '2023-05-15', 8000.00, 'NEFT', 'RCP009', 'Success', 'Monthly installment'),
(10, 10, '2023-06-01', 7000.00, 'IMPS', 'RCP010', 'Pending', 'Confirmation pending'),
(11, 11, '2022-04-01', 18000.00, 'UPI', 'RCP011', 'Success', 'EMI for business loan'),
(12, 12, '2023-08-01', 16000.00, 'RTGS', 'RCP012', 'Success', 'Half-yearly EMI'),
(13, 13, '2023-09-15', 4000.00, 'Cash', 'RCP013', 'Success', 'Gold loan payment'),
(14, 14, '2023-03-01', 7500.00, 'Cheque', 'RCP014', 'Success', 'Installment paid'),
(15, 15, '2022-12-20', 14000.00, 'UPI', 'RCP015', 'Success', 'Car loan EMI'),
(16, 16, '2023-02-01', 12000.00, 'NEFT', 'RCP016', 'Success', 'Quarterly payment'),
(17, 17, '2022-11-01', 16000.00, 'Cash', 'RCP017', 'Success', 'Home loan EMI'),
(18, 18, '2023-06-25', 10000.00, 'Cheque', 'RCP018', 'Failed', 'Cheque bounce'),
(19, 19, '2023-08-05', 6000.00, 'UPI', 'RCP019', 'Pending', 'Pending confirmation'),
(20, 20, '2021-04-01', 9000.00, 'IMPS', 'RCP020', 'Success', 'Final payment');

TRUNCATE TABLE  Loan_Payment;
DROP TABLE  Loan_Payment;

-- QURIES:

-- 1. Show all loan payments:
SELECT * FROM Loan_Payment;

-- 2. Display only payment date, amount paid and mode:
SELECT payment_date, amount_paid, mode_of_payment FROM Loan_Payment;

-- 3. Get only successful payments:
SELECT * FROM Loan_Payment WHERE status = 'Success';

-- 4. Show payments above ₹10,000:
SELECT * FROM Loan_Payment WHERE amount_paid > 10000;

-- 5. Find payments made via UPI:
SELECT * FROM Loan_Payment WHERE mode_of_payment = 'UPI';

-- 6. List payments ordered by amount (highest first):
SELECT * FROM Loan_Payment ORDER BY amount_paid DESC;

-- 7. Find all failed or pending payments:
SELECT * FROM Loan_Payment WHERE status IN ('Failed', 'Pending');

-- 8. Get total payment amount for each loan:
SELECT loan_id, SUM(amount_paid) AS total_paid 
FROM Loan_Payment 
GROUP BY loan_id;

-- 9. Count number of payments by each mode:
SELECT mode_of_payment, COUNT(*) AS total 
FROM Loan_Payment 
GROUP BY mode_of_payment;

-- 10. Show loans where total payments > ₹20,000:
SELECT loan_id, SUM(amount_paid) AS total_paid 
FROM Loan_Payment 
GROUP BY loan_id 
HAVING SUM(amount_paid) > 20000;

-- 11. Update status to 'Success' for payment ID 4:
UPDATE Loan_Payment 
SET status = 'Success' 
WHERE payment_id = 4;

-- 12. Update remarks for all failed payments:
UPDATE Loan_Payment 
SET remarks = 'Payment Failed - Retry Required' 
WHERE status = 'Failed';

-- 13. Change payment mode from ‘Cash’ to ‘Branch Deposit’:
UPDATE Loan_Payment 
SET mode_of_payment = 'Branch Deposit' 
WHERE mode_of_payment = 'Cash';

-- 14. Delete failed payments:
DELETE FROM Loan_Payment 
WHERE status = 'Failed';

-- 15. Delete payments below ₹5000:
DELETE FROM Loan_Payment 
WHERE amount_paid < 5000;

-- 16. Add a column to store late fees:
ALTER TABLE Loan_Payment 
ADD late_fee DECIMAL(10,2);

-- 17. Add a boolean column is_first_payment:
ALTER TABLE Loan_Payment 
ADD is_first_payment BOOLEAN DEFAULT FALSE;

-- 18. Change remarks column to VARCHAR(100):
ALTER TABLE Loan_Payment 
MODIFY remarks VARCHAR(100);

-- 19. Rename column receipt_number to receipt_no:
ALTER TABLE Loan_Payment 
RENAME COLUMN receipt_number TO receipt_no;

-- 20. Drop the remarks column (⚠️ irreversible unless backed up):
ALTER TABLE Loan_Payment 
DROP COLUMN remarks;

-- 9. Credit_Card

CREATE TABLE Credit_Card (
    card_id INT PRIMARY KEY,
    customer_id INT,
    card_number CHAR(16) UNIQUE NOT NULL,
    expiry_date DATE,
    cvv CHAR(3) NOT NULL,
    limit_amount DECIMAL(10,2),
    current_balance DECIMAL(10,2),
    issue_date DATE ,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

INSERT INTO Credit_Card (card_id, customer_id, card_number, expiry_date, cvv, limit_amount, current_balance, issue_date, is_active) VALUES
(1, 1, '4567123412345678', '2027-06-30', '123', 200000.00, 45000.00, '2022-06-30', TRUE),
(2, 2, '4567123412345679', '2026-11-15', '234', 150000.00, 32000.00, '2021-11-15', TRUE),
(3, 3, '4567123412345680', '2025-12-01', '345', 100000.00, 15000.00, '2020-12-01', TRUE),
(4, 4, '4567123412345681', '2028-04-20', '456', 250000.00, 70000.00, '2023-04-20', TRUE),
(5, 5, '4567123412345682', '2026-08-25', '567', 180000.00, 5000.00, '2021-08-25', TRUE),
(6, 6, '4567123412345683', '2027-09-15', '678', 220000.00, 19000.00, '2022-09-15', TRUE),
(7, 7, '4567123412345684', '2029-01-01', '789', 300000.00, 50000.00, '2024-01-01', TRUE),
(8, 8, '4567123412345685', '2026-02-10', '890', 175000.00, 8000.00, '2021-02-10', TRUE),
(9, 9, '4567123412345686', '2025-07-31', '901', 90000.00, 22000.00, '2020-07-31', TRUE),
(10, 10, '4567123412345687', '2028-10-05', '012', 120000.00, 40000.00, '2023-10-05', TRUE),
(11, 11, '4567123412345688', '2026-03-12', '321', 160000.00, 9000.00, '2021-03-12', TRUE),
(12, 12, '4567123412345689', '2027-01-15', '432', 200000.00, 60000.00, '2022-01-15', TRUE),
(13, 13, '4567123412345690', '2025-11-11', '543', 140000.00, 17000.00, '2020-11-11', TRUE),
(14, 14, '4567123412345691', '2028-06-06', '654', 195000.00, 30000.00, '2023-06-06', TRUE),
(15, 15, '4567123412345692', '2029-08-08', '765', 250000.00, 110000.00, '2024-08-08', TRUE),
(16, 16, '4567123412345693', '2027-12-31', '876', 175000.00, 35000.00, '2022-12-31', TRUE),
(17, 17, '4567123412345694', '2026-07-07', '987', 100000.00, 0.00, '2021-07-07', TRUE),
(18, 18, '4567123412345695', '2028-03-03', '098', 180000.00, 26000.00, '2023-03-03', TRUE),
(19, 19, '4567123412345696', '2029-05-05', '109', 160000.00, 18000.00, '2024-05-05', TRUE),
(20, 20, '4567123412345697', '2027-04-04', '210', 200000.00, 15000.00, '2022-04-04', TRUE);

TRUNCATE TABLE Credit_Card ;
DROP TABLE Credit_Card;  

-- QURIES:

-- 1. Show all credit card records:
SELECT * FROM Credit_Card;

-- 2. Display card numbers and their current balances:
SELECT card_number, current_balance FROM Credit_Card;

-- 3. Find credit cards with a limit more than ₹200,000:
SELECT * FROM Credit_Card WHERE limit_amount > 200000;

-- 4. Get credit cards that expire after 2027:
SELECT * FROM Credit_Card WHERE expiry_date > '2027-01-01';

-- 5. List cards with balance above ₹50,000:
SELECT * FROM Credit_Card WHERE current_balance > 50000;

-- 6. Sort credit cards by current balance in descending order:
SELECT * FROM Credit_Card ORDER BY current_balance DESC;

-- 7. Show customer IDs with active cards only:
SELECT customer_id FROM Credit_Card WHERE is_active = TRUE;

-- 8. Find the highest credit card limit:
SELECT MAX(limit_amount) AS highest_limit FROM Credit_Card;

-- 9. Calculate the total current balance of all cards:
SELECT SUM(current_balance) AS total_balance FROM Credit_Card;

-- 10. Group cards by limit amount and count how many have same limit:
SELECT limit_amount, COUNT(*) AS total_cards
FROM Credit_Card
GROUP BY limit_amount;

-- 11. Increase credit limit of card_id 1 by ₹10,000:
UPDATE Credit_Card 
SET limit_amount = limit_amount + 10000 
WHERE card_id = 1;

-- 12. Set is_active to FALSE for cards expired before 2025:
UPDATE Credit_Card 
SET is_active = FALSE 
WHERE expiry_date < '2025-01-01';

-- 13. Update current balance to ₹0 for card_id 17:
UPDATE Credit_Card 
SET current_balance = 0 
WHERE card_id = 17;

-- 14. Delete cards with zero balance:
DELETE FROM Credit_Card 
WHERE current_balance = 0;

-- 15. Delete cards issued before 2021:
DELETE FROM Credit_Card 
WHERE issue_date < '2021-01-01';

-- 16. Add a column card_type (e.g., 'Visa', 'MasterCard'):
ALTER TABLE Credit_Card 
ADD card_type VARCHAR(20);

-- 17. Rename column limit_amount to credit_limit:
ALTER TABLE Credit_Card 
RENAME COLUMN limit_amount TO credit_limit;

-- 18. Change cvv column to CHAR(4) to support 4-digit CVVs:
ALTER TABLE Credit_Card 
MODIFY cvv CHAR(4);

-- 19. Add a column for card usage status (e.g., 'High', 'Medium', 'Low'):
ALTER TABLE Credit_Card 
ADD usage_status VARCHAR(15);

-- 20. Drop the is_active column (⚠️ Only if no longer needed):
ALTER TABLE Credit_Card 
DROP COLUMN is_active;
-- 10. Credit_Card_Transaction

CREATE TABLE Credit_Card_Transaction (
    txn_id INT PRIMARY KEY,
    card_id INT,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) CHECK (amount > 0),
    merchant_name VARCHAR(100),
    status VARCHAR(20),
    remarks TEXT,
    FOREIGN KEY (card_id) REFERENCES Credit_Card(card_id)
);

INSERT INTO Credit_Card_Transaction (txn_id, card_id, transaction_date, amount, merchant_name, status, remarks) VALUES
(1, 1, '2023-07-01 10:15:00', 1500.75, 'Amazon', 'Success', 'Online shopping'),
(2, 2, '2023-07-02 14:22:00', 2300.00, 'Flipkart', 'Success', 'Electronics purchase'),
(3, 3, '2023-07-03 09:30:00', 125.50, 'Starbucks', 'Success', 'Coffee'),
(4, 4, '2023-07-04 20:10:00', 550.00, 'Big Bazaar', 'Success', 'Groceries'),
(5, 5, '2023-07-05 16:45:00', 10000.00, 'Apple Store', 'Pending', 'iPhone purchase'),
(6, 6, '2023-07-06 12:00:00', 500.00, 'Domino\'s', 'Success', 'Food order'),
(7, 7, '2023-07-07 18:25:00', 3000.00, 'Myntra', 'Failed', 'Payment failed'),
(8, 8, '2023-07-08 08:50:00', 750.00, 'Cafe Coffee Day', 'Success', 'Beverages'),
(9, 9, '2023-07-09 19:30:00', 1200.00, 'Nike', 'Success', 'Sportswear'),
(10, 10, '2023-07-10 21:00:00', 450.00, 'Local Grocery', 'Success', 'Daily needs'),
(11, 11, '2023-07-11 10:05:00', 2750.00, 'Samsung Store', 'Success', 'Mobile purchase'),
(12, 12, '2023-07-12 13:15:00', 1000.00, 'Domino\'s', 'Success', 'Food delivery'),
(13, 13, '2023-07-13 15:40:00', 230.00, 'Subway', 'Success', 'Lunch'),
(14, 14, '2023-07-14 11:25:00', 600.00, 'Bookstore', 'Success', 'Books purchase'),
(15, 15, '2023-07-15 17:55:00', 4200.00, 'Reliance Digital', 'Success', 'Electronics'),
(16, 16, '2023-07-16 14:10:00', 150.00, 'Pharmacy', 'Success', 'Medicines'),
(17, 17, '2023-07-17 09:00:00', 900.00, 'Cafe Coffee Day', 'Pending', 'Payment verification'),
(18, 18, '2023-07-18 20:30:00', 650.00, 'Big Bazaar', 'Success', 'Groceries'),
(19, 19, '2023-07-19 16:45:00', 12000.00, 'Car Service Center', 'Success', 'Car maintenance'),
(20, 20, '2023-07-20 18:20:00', 3200.00, 'Nike', 'Success', 'Sportswear purchase');

TRUNCATE TABLE Credit_Card_Transaction;
DROP TABLE Credit_Card_Transaction;

-- QURIES:

-- 1. Show all transactions:
SELECT * FROM Credit_Card_Transaction;

-- 2. Get all successful transactions:
SELECT * FROM Credit_Card_Transaction
WHERE status = 'Success';

-- 3. Get transactions above ₹5000:
SELECT * FROM Credit_Card_Transaction
WHERE amount > 5000;

-- 4. Get transactions from 'Domino's':
SELECT * FROM Credit_Card_Transaction
WHERE merchant_name = 'Domino''s';

-- 5. Show transaction ID, amount, and merchant name only:
SELECT txn_id, amount, merchant_name
FROM Credit_Card_Transaction;

-- 6. List transactions sorted by amount (descending):
SELECT * FROM Credit_Card_Transaction
ORDER BY amount DESC;

-- 7. Count total number of transactions:
SELECT COUNT(*) AS total_transactions
FROM Credit_Card_Transaction;

-- 8. Show total amount spent:
SELECT SUM(amount) AS total_spent
FROM Credit_Card_Transaction
WHERE status = 'Success';

-- 9. Find the highest transaction:
SELECT * FROM Credit_Card_Transaction
ORDER BY amount DESC
LIMIT 1;

-- 10. Show all pending or failed transactions:
SELECT * FROM Credit_Card_Transaction
WHERE status IN ('Pending', 'Failed');

-- 11. Update status of a transaction (txn_id = 5) from 'Pending' to 'Success':
UPDATE Credit_Card_Transaction
SET status = 'Success'
WHERE txn_id = 5;

-- 12. Change merchant name from 'Nike' to 'Nike Store':
UPDATE Credit_Card_Transaction
SET merchant_name = 'Nike Store'
WHERE merchant_name = 'Nike';

-- 13. Add remark "Manual review" to failed transactions:
UPDATE Credit_Card_Transaction
SET remarks = 'Manual review'
WHERE status = 'Failed';

-- 14. Delete failed transactions:
DELETE FROM Credit_Card_Transaction
WHERE status = 'Failed';

-- 15. Delete transactions below ₹200:
DELETE FROM Credit_Card_Transaction
WHERE amount < 200;

-- 16. Add a column for transaction_type (e.g., Online, POS):
ALTER TABLE Credit_Card_Transaction
ADD transaction_type VARCHAR(20);

-- 17. Change amount data type to support more precision:
ALTER TABLE Credit_Card_Transaction
MODIFY amount DECIMAL(12, 2);

-- 18. Rename column remarks to notes:
ALTER TABLE Credit_Card_Transaction
RENAME COLUMN remarks TO notes;

-- 19. Add a new column currency with default 'INR':
ALTER TABLE Credit_Card_Transaction
ADD currency VARCHAR(10) DEFAULT 'INR';

-- 20. Drop column status ( Only if no longer needed):
ALTER TABLE Credit_Card_Transaction
DROP COLUMN status;
-- 11. ATM

CREATE TABLE ATM (
    atm_id INT PRIMARY KEY,
    branch_id INT,
    location VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    installed_date DATE,
    manufacturer VARCHAR(50),
    model VARCHAR(50),
    capacity INT CHECK (capacity >= 100),
    status VARCHAR(20),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

INSERT INTO ATM (atm_id, branch_id, location, is_active, installed_date, manufacturer, model, capacity, status) VALUES
(1, 1, 'Downtown Mall', TRUE, '2021-05-10', 'NCR', 'SelfServ 22', 500, 'Active'),
(2, 1, 'Airport Terminal 1', TRUE, '2020-08-22', 'Diebold', 'Opteva 328', 400, 'Active'),
(3, 2, 'Main Street Plaza', TRUE, '2022-01-15', 'Hyosung', 'MX8800', 300, 'Active'),
(4, 2, 'City Library', FALSE, '2019-04-18', 'NCR', 'SelfServ 34', 350, 'Inactive'),
(5, 3, 'University Campus', TRUE, '2023-02-10', 'Diebold', 'Opteva 520', 600, 'Active'),
(6, 3, 'Tech Park', TRUE, '2021-11-05', 'Wincor Nixdorf', 'ProCash 280', 450, 'Maintenance'),
(7, 4, 'Central Station', TRUE, '2020-12-20', 'Hyosung', 'MX7600', 550, 'Active'),
(8, 4, 'North Market', TRUE, '2022-03-25', 'NCR', 'SelfServ 14', 300, 'Active'),
(9, 5, 'City Hall', FALSE, '2018-07-30', 'Diebold', 'Opteva 740', 400, 'Inactive'),
(10, 5, 'Shopping Center', TRUE, '2021-06-01', 'Hyosung', 'MX8800', 500, 'Active'),
(11, 1, 'East Side Plaza', TRUE, '2023-05-20', 'NCR', 'SelfServ 22', 400, 'Active'),
(12, 2, 'Medical Center', TRUE, '2022-07-12', 'Diebold', 'Opteva 328', 450, 'Active'),
(13, 3, 'West End Station', FALSE, '2019-09-05', 'Wincor Nixdorf', 'ProCash 280', 350, 'Maintenance'),
(14, 4, 'Harbor Front', TRUE, '2020-10-10', 'NCR', 'SelfServ 34', 600, 'Active'),
(15, 5, 'Civic Center', TRUE, '2021-01-18', 'Hyosung', 'MX7600', 550, 'Active'),
(16, 1, 'Green Park', TRUE, '2022-12-01', 'Diebold', 'Opteva 520', 400, 'Active'),
(17, 2, 'City Zoo', TRUE, '2023-03-11', 'NCR', 'SelfServ 22', 500, 'Active'),
(18, 3, 'Old Town', FALSE, '2017-06-06', 'Wincor Nixdorf', 'ProCash 280', 300, 'Inactive'),
(19, 4, 'Tech Hub', TRUE, '2024-01-15', 'Hyosung', 'MX8800', 600, 'Active'),
(20, 5, 'Finance District', TRUE, '2021-08-24', 'Diebold', 'Opteva 328', 450, 'Active');

TRUNCATE TABLE ATM;

-- 1. Show all ATM record
SELECT * FROM ATM;

-- 2. List all active ATMs:
SELECT * FROM ATM
WHERE is_active = TRUE;

-- 3. List ATMs that are currently in maintenance:
SELECT * FROM ATM
WHERE status = 'Maintenance';

-- 4. Get ATMs with capacity more than 500:
SELECT * FROM ATM
WHERE capacity > 500;

-- 5. Get ATM locations installed after 2022:
SELECT location, installed_date FROM ATM
WHERE installed_date > '2022-01-01';

-- 6. List all unique manufacturers:
SELECT DISTINCT manufacturer FROM ATM;

-- 7. Count total number of active ATMs:
SELECT COUNT(*) AS active_atms
FROM ATM
WHERE is_active = TRUE;

-- 8. Find ATMs installed in branch 1:
SELECT * FROM ATM
WHERE branch_id = 1;

-- 9. Get ATMs located in malls or parks:
SELECT * FROM ATM
WHERE location LIKE '%Mall%' OR location LIKE '%Park%';

-- 10. List ATM locations sorted by installed date (newest first):
SELECT location, installed_date FROM ATM
ORDER BY installed_date DESC;

-- 11. Mark ATM at 'City Library' as active:
UPDATE ATM
SET is_active = TRUE, status = 'Active'
WHERE location = 'City Library';

-- 12. Update capacity of ATM at 'Finance District' to 600:
UPDATE ATM
SET capacity = 600
WHERE location = 'Finance District';

-- 13. Change status of all inactive ATMs to 'Maintenance':
UPDATE ATM
SET status = 'Maintenance'
WHERE is_active = FALSE;

-- 14. Delete ATMs that are inactive:
DELETE FROM ATM
WHERE is_active = FALSE;

-- 15. Delete ATM installed before 2019:
DELETE FROM ATM
WHERE installed_date < '2019-01-01';

-- 16. Add a column for ATM type (e.g., Indoor, Outdoor):
ALTER TABLE ATM
ADD atm_type VARCHAR(20);

-- 17. Change capacity column to allow larger values:
ALTER TABLE ATM
MODIFY capacity INT;

-- 18. Rename column model to atm_model:
ALTER TABLE ATM
RENAME COLUMN model TO atm_model;

-- 19. Add a column for last_maintenance_date:
ALTER TABLE ATM
ADD last_maintenance_date DATE;

-- 20. Drop column status (if no longer required):
ALTER TABLE ATM
DROP COLUMN status;
DROP TABLE ATM;


SELECT * FROM ATM WHERE atm_id = 1;
SELECT * FROM Account WHERE account_id = 1;

-- 12. ATM_Transaction

CREATE TABLE ATM_Transaction (
    txn_id INT PRIMARY KEY,
    atm_id INT,
    account_id INT,
    txn_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    txn_type VARCHAR(20),
    amount DECIMAL(10,2) CHECK (amount > 0),
    status VARCHAR(20),
    balance_after_txn DECIMAL(10,2),
    FOREIGN KEY (atm_id) REFERENCES ATM(atm_id),
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

INSERT INTO ATM_Transaction (txn_id, atm_id, account_id, txn_date, txn_type, amount, status, balance_after_txn) VALUES
(1, 1, 1001, '2025-08-01 09:15:00', 'Withdrawal', 200.00, 'Success', 1800.00),
(2, 2, 1002, '2025-08-01 10:30:00', 'Deposit', 500.00, 'Success', 2500.00), 
(3, 3, 1003, '2025-08-02 11:45:00', 'Withdrawal', 100.00, 'Success', 900.00),
(4, 4, 1004, '2025-08-02 12:10:00', 'Balance Inquiry', 0.01, 'Success', 1500.00),
(5, 5, 1005, '2025-08-02 14:00:00', 'Withdrawal', 300.00, 'Failed', 1200.00),
(6, 6, 1006, '2025-08-03 08:20:00', 'Withdrawal', 150.00, 'Success', 850.00),
(7, 7, 1007, '2025-08-03 10:00:00', 'Deposit', 700.00, 'Success', 2700.00),
(8, 8, 1008, '2025-08-03 11:30:00', 'Withdrawal', 400.00, 'Success', 1600.00),
(9, 9, 1009, '2025-08-04 09:05:00', 'Withdrawal', 250.00, 'Success', 1250.00),
(10, 10, 1010, '2025-08-04 13:45:00', 'Deposit', 1000.00, 'Success', 4000.00),
(11, 11, 1001, '2025-08-05 07:50:00', 'Withdrawal', 50.00, 'Success', 1750.00),
(12, 12, 1002, '2025-08-05 15:00:00', 'Withdrawal', 200.00, 'Success', 2300.00),
(13, 13, 1003, '2025-08-06 09:30:00', 'Balance Inquiry', 0.01, 'Success', 900.00),
(14, 14, 1004, '2025-08-06 16:20:00', 'Withdrawal', 500.00, 'Failed', 1500.00),
(15, 15, 1005, '2025-08-06 17:00:00', 'Deposit', 300.00, 'Success', 1500.00),
(16, 16, 1006, '2025-08-07 08:10:00', 'Withdrawal', 100.00, 'Success', 750.00),
(17, 17, 1007, '2025-08-07 11:15:00', 'Withdrawal', 250.00, 'Success', 2450.00),
(18, 18, 1008, '2025-08-08 14:35:00', 'Deposit', 400.00, 'Success', 2000.00),
(19, 19, 1009, '2025-08-08 15:50:00', 'Withdrawal', 300.00, 'Success', 950.00),
(20, 20, 1010, '2025-08-09 10:05:00', 'Balance Inquiry', 0.01, 'Success', 4000.00);

TRUNCATE TABLE  ATM_Transaction;
DROP TABLE  ATM_Transaction;

-- QURIES:

-- 1. Show all ATM transactions:
SELECT * FROM ATM_Transaction;

-- 2. Get all successful withdrawals:
SELECT * FROM ATM_Transaction
WHERE txn_type = 'Withdrawal' AND status = 'Success';

-- 3. List all deposits made after August 5, 2025:
SELECT * FROM ATM_Transaction
WHERE txn_type = 'Deposit' AND txn_date > '2025-08-05';

-- 4. Show failed transactions only:
SELECT * FROM ATM_Transaction
WHERE status = 'Failed';

-- 5. Find transactions for account ID 1003:
SELECT * FROM ATM_Transaction
WHERE account_id = 1003;

-- 6. Get transactions where the balance after transaction is less than 1000:
SELECT * FROM ATM_Transaction
WHERE balance_after_txn < 1000;

-- 7. Count total number of balance inquiries:
SELECT COUNT(*) AS total_inquiries
FROM ATM_Transaction
WHERE txn_type = 'Balance Inquiry';

-- 8. Find total withdrawn amount (only successful withdrawals):
SELECT SUM(amount) AS total_withdrawn
FROM ATM_Transaction
WHERE txn_type = 'Withdrawal' AND status = 'Success';

-- 9. Show transactions between August 3 and August 6, 2025:
SELECT * FROM ATM_Transaction
WHERE txn_date BETWEEN '2025-08-03' AND '2025-08-06';

-- 10. List transactions grouped by transaction type:
SELECT txn_type, COUNT(*) AS total_transactions
FROM ATM_Transaction
GROUP BY txn_type;


-- 11. Update status of a failed withdrawal (txn_id = 5) to 'Success':
UPDATE ATM_Transaction
SET status = 'Success'
WHERE txn_id = 5;

-- 12. Set balance after transaction to 2000 for account_id 1005:
UPDATE ATM_Transaction
SET balance_after_txn = 2000
WHERE account_id = 1005;

-- 13. Mark all failed transactions as 'Retry Needed':
UPDATE ATM_Transaction
SET status = 'Retry Needed'
WHERE status = 'Failed';

-- 14. Delete all balance inquiry transactions:
DELETE FROM ATM_Transaction
WHERE txn_type = 'Balance Inquiry';

-- 15. Delete transactions older than August 3, 2025:
DELETE FROM ATM_Transaction
WHERE txn_date < '2025-08-03';

-- 16. Add a column for transaction location:
ALTER TABLE ATM_Transaction
ADD txn_location VARCHAR(100);

-- 17. Change amount column data type to allow more precision:
ALTER TABLE ATM_Transaction
MODIFY amount DECIMAL(12,2);

-- 18. Rename column txn_type to transaction_type:
ALTER TABLE ATM_Transaction
RENAME COLUMN txn_type TO transaction_type;

-- 19. Add a column to store the ATM operator's ID:
ALTER TABLE ATM_Transaction
ADD operator_id INT;

-- 20. Drop column remarks if it exists:
ALTER TABLE ATM_Transaction
DROP COLUMN remarks;

-- 13. Currency

CREATE TABLE Currency (
    currency_code CHAR(3) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    symbol VARCHAR(10),
    country VARCHAR(50),
    exchange_rate_to_inr DECIMAL(10,4),
    is_active BOOLEAN DEFAULT TRUE,
    updated_on DATE,
    created_on DATE ,
    UNIQUE (name)
);

INSERT INTO Currency (currency_code, name, symbol, country, exchange_rate_to_inr, is_active, updated_on, created_on) VALUES
('USD', 'US Dollar', '$', 'United States', 83.2000, TRUE, '2025-08-20', '2020-01-01'),
('EUR', 'Euro', '€', 'European Union', 89.7500, TRUE, '2025-08-20', '2020-01-01'),
('GBP', 'British Pound', '£', 'United Kingdom', 104.3500, TRUE, '2025-08-20', '2020-01-01'),
('JPY', 'Japanese Yen', '¥', 'Japan', 0.5700, TRUE, '2025-08-20', '2020-01-01'),
('AUD', 'Australian Dollar', 'A$', 'Australia', 54.8000, TRUE, '2025-08-20', '2020-01-01'),
('CAD', 'Canadian Dollar', 'C$', 'Canada', 61.2000, TRUE, '2025-08-20', '2020-01-01'),
('CHF', 'Swiss Franc', 'Fr', 'Switzerland', 92.3000, TRUE, '2025-08-20', '2020-01-01'),
('CNY', 'Chinese Yuan', '¥', 'China', 11.4000, TRUE, '2025-08-20', '2020-01-01'),
('SGD', 'Singapore Dollar', 'S$', 'Singapore', 61.5000, TRUE, '2025-08-20', '2020-01-01'),
('NZD', 'New Zealand Dollar', 'NZ$', 'New Zealand', 49.3000, TRUE, '2025-08-20', '2020-01-01'),
('HKD', 'Hong Kong Dollar', 'HK$', 'Hong Kong', 10.6200, TRUE, '2025-08-20', '2020-01-01'),
('SEK', 'Swedish Krona', 'kr', 'Sweden', 7.8000, TRUE, '2025-08-20', '2020-01-01'),
('NOK', 'Norwegian Krone', 'kr', 'Norway', 7.9500, TRUE, '2025-08-20', '2020-01-01'),
('DKK', 'Danish Krone', 'kr', 'Denmark', 12.0000, TRUE, '2025-08-20', '2020-01-01'),
('ZAR', 'South African Rand', 'R', 'South Africa', 4.5000, TRUE, '2025-08-20', '2020-01-01'),
('RUB', 'Russian Ruble', '₽', 'Russia', 0.8700, TRUE, '2025-08-20', '2020-01-01'),
('AED', 'UAE Dirham', 'د.إ', 'United Arab Emirates', 22.6500, TRUE, '2025-08-20', '2020-01-01'),
('SAR', 'Saudi Riyal', '﷼', 'Saudi Arabia', 22.1700, TRUE, '2025-08-20', '2020-01-01'),
('THB', 'Thai Baht', '฿', 'Thailand', 2.3500, TRUE, '2025-08-20', '2020-01-01'),
('KRW', 'South Korean Won', '₩', 'South Korea', 0.0630, TRUE, '2025-08-20', '2020-01-01');

TRUNCATE TABLE Currency;
DROP TABLE Currency;

-- QURIES:

-- 1. Show all currencies:
SELECT * FROM Currency;

-- 2. Get all active currencies:
SELECT * FROM Currency
WHERE is_active = TRUE;

-- 3. List currencies with exchange rate greater than 50 INR:
SELECT * FROM Currency
WHERE exchange_rate_to_inr > 50;

-- 4. Show currency names and exchange rates, sorted by exchange rate (highest first):
SELECT name, exchange_rate_to_inr
FROM Currency
ORDER BY exchange_rate_to_inr DESC;

-- 5. Show all currencies from Europe (country names like 'Sweden', 'Denmark', etc.):
SELECT * FROM Currency
WHERE country IN ('European Union', 'United Kingdom', 'Sweden', 'Norway', 'Denmark');

-- 6. Find the currency with the lowest exchange rate:
SELECT * FROM Currency
ORDER BY exchange_rate_to_inr ASC
LIMIT 1;

-- 7. Count how many active currencies exist:
SELECT COUNT(*) AS active_currency_count
FROM Currency
WHERE is_active = TRUE;

-- 8. Get all currencies updated on '2025-08-20':
SELECT * FROM Currency
WHERE updated_on = '2025-08-20';

-- 9. Update exchange rate of USD to 84.00:
UPDATE Currency
SET exchange_rate_to_inr = 84.00
WHERE currency_code = 'USD';

-- 10. Deactivate a currency (e.g., Russian Ruble):
UPDATE Currency
SET is_active = FALSE
WHERE currency_code = 'RUB';

-- 11. Update the updated_on date for all currencies:
UPDATE Currency
SET updated_on = CURRENT_DATE;

-- 12. Increase exchange rate of all currencies by 1%:
UPDATE Currency
SET exchange_rate_to_inr = exchange_rate_to_inr * 1.01;

-- 13. Delete a currency by code (e.g., HKD):
DELETE FROM Currency
WHERE currency_code = 'HKD';

-- 14. Delete all inactive currencies:
DELETE FROM Currency
WHERE is_active = FALSE;

-- 15. Add a new column for currency description:
ALTER TABLE Currency
ADD description VARCHAR(255);

-- 16. Rename exchange_rate_to_inr to rate_to_inr:
ALTER TABLE Currency
RENAME COLUMN exchange_rate_to_inr TO rate_to_inr;

-- 17. Change data type of exchange_rate_to_inr to more precision:
ALTER TABLE Currency
MODIFY exchange_rate_to_inr DECIMAL(10,4);

-- 18. Drop the created_on column:
ALTER TABLE Currency
DROP COLUMN created_on;

CREATE TABLE Exchange_Rate (
    rate_id INT PRIMARY KEY,
    from_currency CHAR(3),
    to_currency CHAR(3),
    rate DECIMAL(10,4) CHECK (rate > 0),
    effective_date DATE,
    source VARCHAR(100),
    FOREIGN KEY (from_currency) REFERENCES Currency(currency_code),
    FOREIGN KEY (to_currency) REFERENCES Currency(currency_code)
);

INSERT INTO Exchange_Rate (rate_id, from_currency, to_currency, rate, effective_date, source) VALUES
(1, 'USD', 'INR', 83.2000, '2025-08-20', 'XE.com'),
(2, 'EUR', 'INR', 89.7500, '2025-08-20', 'XE.com'),
(3, 'GBP', 'INR', 104.3500, '2025-08-20', 'Reuters'),
(4, 'JPY', 'INR', 0.5700, '2025-08-20', 'Bloomberg'),
(5, 'AUD', 'INR', 54.8000, '2025-08-20', 'OANDA'),
(6, 'CAD', 'INR', 61.2000, '2025-08-20', 'OANDA'),
(7, 'CHF', 'INR', 92.3000, '2025-08-20', 'XE.com'),
(8, 'CNY', 'INR', 11.4000, '2025-08-20', 'China Central Bank'),
(9, 'SGD', 'INR', 61.5000, '2025-08-20', 'MAS Singapore'),
(10, 'NZD', 'INR', 49.3000, '2025-08-20', 'XE.com'),
(11, 'USD', 'EUR', 0.9270, '2025-08-20', 'Reuters'),
(12, 'EUR', 'USD', 1.0790, '2025-08-20', 'Reuters'),
(13, 'USD', 'JPY', 145.9300, '2025-08-20', 'Bloomberg'),
(14, 'JPY', 'USD', 0.0068, '2025-08-20', 'Bloomberg'),
(15, 'GBP', 'USD', 1.2540, '2025-08-20', 'Reuters'),
(16, 'USD', 'GBP', 0.7975, '2025-08-20', 'Reuters'),
(17, 'INR', 'AED', 0.0441, '2025-08-20', 'XE.com'),
(18, 'INR', 'SAR', 0.0451, '2025-08-20', 'XE.com'),
(19, 'USD', 'CAD', 1.2750, '2025-08-20', 'OANDA'),
(20, 'CAD', 'USD', 0.7843, '2025-08-20', 'OANDA');

TRUNCATE TABLE Exchange_Rate;
DROP TABLE Exchange_Rate;

-- QURIES:

-- 1. Show all exchange rate records:
SELECT * FROM Exchange_Rate;

-- 2. List all rates where from_currency is 'USD':
SELECT * FROM Exchange_Rate
WHERE from_currency = 'USD';

-- 3. Get exchange rate from USD to INR:
SELECT rate FROM Exchange_Rate
WHERE from_currency = 'USD' AND to_currency = 'INR';

-- 4. List exchange rates greater than 100:
SELECT * FROM Exchange_Rate
WHERE rate > 100;

-- 5. Find all rates sourced from 'XE.com':
SELECT * FROM Exchange_Rate
WHERE source = 'XE.com';

-- 6. Show unique from_currency values:
SELECT DISTINCT from_currency FROM Exchange_Rate;

-- 7. List exchange rates ordered by rate descending:
SELECT * FROM Exchange_Rate
ORDER BY rate DESC;

-- 8. Show count of records for each source:
SELECT source, COUNT(*) AS count
FROM Exchange_Rate
GROUP BY source;

-- 9. Show all exchange rates between INR and other currencies:
SELECT * FROM Exchange_Rate
WHERE from_currency = 'INR' OR to_currency = 'INR';

-- 10. Get all exchange rates effective on '2025-08-20':
SELECT * FROM Exchange_Rate
WHERE effective_date = '2025-08-20';

-- 11. Update the rate from USD to INR to 84.00:
UPDATE Exchange_Rate
SET rate = 84.00
WHERE from_currency = 'USD' AND to_currency = 'INR';

-- 12. Change source from 'XE.com' to 'Official':
UPDATE Exchange_Rate
SET source = 'Official'
WHERE source = 'XE.com';

-- 13. Increase all INR-related exchange rates by 1%:
UPDATE Exchange_Rate
SET rate = rate * 1.01
WHERE to_currency = 'INR';

-- 14. Set effective_date to today’s date for USD rates:
UPDATE Exchange_Rate
SET effective_date = CURRENT_DATE
WHERE from_currency = 'USD';

-- 15. Set all GBP-related records to source = 'Bank of England':
UPDATE Exchange_Rate
SET source = 'Bank of England'
WHERE from_currency = 'GBP' OR to_currency = 'GBP';

-- 16. Delete exchange rate from USD to CAD:
DELETE FROM Exchange_Rate
WHERE from_currency = 'USD' AND to_currency = 'CAD';

-- 17. Delete all rates where source is 'OANDA':
DELETE FROM Exchange_Rate
WHERE source = 'OANDA';

-- 18. Delete all exchange rates older than 2025:
DELETE FROM Exchange_Rate
WHERE effective_date < '2025-01-01';

-- 19. Add a column for conversion fee:
ALTER TABLE Exchange_Rate
ADD conversion_fee DECIMAL(5,2);

-- 20. Change column name rate to exchange_value:
ALTER TABLE Exchange_Rate
RENAME COLUMN rate TO exchange_value;

-- 15. Locker

CREATE TABLE Locker (
    locker_id INT PRIMARY KEY,
    branch_id INT,
    locker_number VARCHAR(20) UNIQUE NOT NULL,
    size VARCHAR(10),
    status VARCHAR(20) DEFAULT 'Available',
    allocated_to INT,
    allocation_date DATE,
    rent_amount DECIMAL(10,2),
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),
    FOREIGN KEY (allocated_to) REFERENCES Customer(customer_id)
);

INSERT INTO Locker (locker_id, branch_id, locker_number, size, status, allocated_to, allocation_date, rent_amount) VALUES
(1, 1, 'LKR-001', 'Small', 'Allocated', 101, '2025-01-10', 1500.00),
(2, 1, 'LKR-002', 'Medium', 'Available', NULL, NULL, 2500.00),
(3, 1, 'LKR-003', 'Large', 'Allocated', 102, '2025-02-12', 3500.00),
(4, 2, 'LKR-004', 'Small', 'Available', NULL, NULL, 1500.00),
(5, 2, 'LKR-005', 'Medium', 'Allocated', 103, '2025-03-01', 2500.00),
(6, 2, 'LKR-006', 'Large', 'Available', NULL, NULL, 3500.00),
(7, 3, 'LKR-007', 'Small', 'Allocated', 104, '2025-04-20', 1500.00),
(8, 3, 'LKR-008', 'Medium', 'Available', NULL, NULL, 2500.00),
(9, 3, 'LKR-009', 'Large', 'Allocated', 105, '2025-05-15', 3500.00),
(10, 4, 'LKR-010', 'Small', 'Available', NULL, NULL, 1500.00),
(11, 4, 'LKR-011', 'Medium', 'Allocated', 106, '2025-06-01', 2500.00),
(12, 4, 'LKR-012', 'Large', 'Available', NULL, NULL, 3500.00),
(13, 5, 'LKR-013', 'Small', 'Allocated', 107, '2025-07-10', 1500.00),
(14, 5, 'LKR-014', 'Medium', 'Available', NULL, NULL, 2500.00),
(15, 5, 'LKR-015', 'Large', 'Allocated', 108, '2025-08-05', 3500.00),
(16, 1, 'LKR-016', 'Small', 'Available', NULL, NULL, 1500.00),
(17, 2, 'LKR-017', 'Medium', 'Allocated', 109, '2025-08-10', 2500.00),
(18, 3, 'LKR-018', 'Large', 'Available', NULL, NULL, 3500.00),
(19, 4, 'LKR-019', 'Small', 'Allocated', 110, '2025-08-15', 1500.00),
(20, 5, 'LKR-020', 'Medium', 'Available', NULL, NULL, 2500.00);

TRUNCATE TABLE Locker ;
DROP TABLE Locker ;

-- QURIES:

-- 1. View all locker details:
SELECT * FROM Locker;

-- 2. Show only available lockers:
SELECT * FROM Locker
WHERE status = 'Available';

-- 3. Show allocated lockers:
SELECT * FROM Locker
WHERE status = 'Allocated';

-- 4. List all lockers from branch 3:
SELECT * FROM Locker
WHERE branch_id = 3;

-- 5. Find all lockers with rent amount more than 3000:
SELECT * FROM Locker
WHERE rent_amount > 3000;

-- 6. Get locker numbers and their sizes:
SELECT locker_number, size FROM Locker;

-- 7. Show all 'Medium' size lockers that are available:
SELECT * FROM Locker
WHERE size = 'Medium' AND status = 'Available';

-- 8. Count how many lockers are allocated:
SELECT COUNT(*) AS allocated_count FROM Locker
WHERE status = 'Allocated';

-- 9. Find the highest rent locker:
SELECT * FROM Locker
ORDER BY rent_amount DESC
LIMIT 1;

-- 10. Show allocated lockers along with allocation date:
SELECT locker_number, allocated_to, allocation_date
FROM Locker
WHERE status = 'Allocated';

-- 11. Update rent amount for all 'Large' lockers to 3600:
UPDATE Locker
SET rent_amount = 3600.00
WHERE size = 'Large';

-- 12. Set locker LKR-002 as allocated to user 120:
UPDATE Locker
SET status = 'Allocated', allocated_to = 120, allocation_date = '2025-08-24'
WHERE locker_number = 'LKR-002';

-- 13. Increase rent for all 'Small' lockers by 100:
UPDATE Locker
SET rent_amount = rent_amount + 100
WHERE size = 'Small';

--  14. Free up locker LKR-011:
UPDATE Locker
SET status = 'Available', allocated_to = NULL, allocation_date = NULL
WHERE locker_number = 'LKR-011';

-- 15. Change branch ID of locker LKR-007 to 2:
UPDATE Locker
SET branch_id = 2
WHERE locker_number = 'LKR-007';

-- 16. Delete locker record with locker_id = 20:
DELETE FROM Locker
WHERE locker_id = 20;

-- 17. Delete all available 'Small' lockers:
DELETE FROM Locker
WHERE status = 'Available' AND size = 'Small';

-- 18. Add a column for locker security level:
ALTER TABLE Locker
ADD security_level VARCHAR(20);

-- 19. Rename column rent_amount to annual_rent:
ALTER TABLE Locker
RENAME COLUMN rent_amount TO annual_rent;



-- 16. Fixed_Deposit

CREATE TABLE Fixed_Deposit (
    fd_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    bank_id INT NOT NULL,
    amount DECIMAL(15,2) CHECK (amount > 0),
    interest_rate DECIMAL(5,2),
    start_date DATE,
    maturity_date DATE,
    status VARCHAR(20) DEFAULT 'Active',
    nominee_name VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (bank_id) REFERENCES Bank(bank_id)
);

INSERT INTO Fixed_Deposit (fd_id, customer_id, bank_id, amount, interest_rate, start_date,maturity_date, status, nominee_name) VALUES
(1, 1, 1, 100000.00, 6.50, '2023-01-01', '2026-01-01', 'Active', 'John Smith'),
(2, 2, 1, 50000.00, 5.75, '2022-03-15', '2025-03-15', 'Active', 'Emily Davis'),
(3, 3, 2, 200000.00, 7.00, '2024-07-01', '2029-07-01', 'Active', 'Robert Brown'),
(4, 4, 3, 75000.00, 6.00, '2021-12-10', '2024-12-10', 'Matured', 'Linda Green'),
(5, 5, 4, 150000.00, 6.25, '2023-09-01', '2026-09-01', 'Active', 'Michael Johnson'),
(6, 6, 5, 120000.00, 5.50, '2022-06-01', '2025-06-01', 'Closed', 'Samantha Clark'),
(7, 7, 2, 90000.00, 6.80, '2023-11-11', '2028-11-11', 'Active', 'David White'),
(8, 8, 1, 300000.00, 7.10, '2024-02-20', '2027-02-20', 'Active', 'Karen Wilson'),
(9, 9, 3, 85000.00, 5.90, '2021-05-25', '2024-05-25', 'Matured', 'Chris Evans'),
(10, 10, 4, 130000.00, 6.75, '2023-08-10', '2026-08-10', 'Active', 'Patricia Moore'),
(11, 1, 2, 50000.00, 6.10, '2022-01-01', '2025-01-01', 'Closed', 'George King'),
(12, 2, 3, 110000.00, 6.30, '2023-04-04', '2026-04-04', 'Active', 'Nancy Lee'),
(13, 3, 5, 145000.00, 6.90, '2023-10-10', '2026-10-10', 'Active', 'Dennis Young'),
(14, 4, 1, 60000.00, 5.95, '2021-07-07', '2024-07-07', 'Matured', 'Barbara Adams'),
(15, 5, 2, 170000.00, 7.25, '2024-01-01', '2029-01-01', 'Active', 'Jeff Hall'),
(16, 6, 3, 80000.00, 6.45, '2022-09-09', '2025-09-09', 'Closed', 'Jessica Scott'),
(17, 7, 4, 125000.00, 5.85, '2023-05-15', '2026-05-15', 'Active', 'Daniel Green'),
(18, 8, 5, 95000.00, 6.55, '2022-08-08', '2025-08-08', 'Matured', 'Laura Baker'),
(19, 9, 1, 40000.00, 6.20, '2021-01-01', '2024-01-01', 'Matured', 'Kevin Wright'),
(20, 10, 2, 220000.00, 7.00, '2024-06-06', '2027-06-06', 'Active', 'Rebecca Harris');

TRUNCATE TABLE Fixed_Deposit;
DROP TABLE Fixed_Deposit;

-- QURIES:

-- 1. Show all fixed deposits:
SELECT * FROM Fixed_Deposit;

-- 2. Show all active fixed deposits:
SELECT * FROM Fixed_Deposit
WHERE status = 'Active';

-- 3. Get all fixed deposits with amount more than 100000:
SELECT * FROM Fixed_Deposit
WHERE amount > 100000;

-- 4. List all matured fixed deposits:
SELECT * FROM Fixed_Deposit
WHERE status = 'Matured';

-- 5. Get fixed deposits for customer_id = 1:
SELECT * FROM Fixed_Deposit
WHERE customer_id = 1;

-- 6. Find the highest interest rate fixed deposit:
SELECT * FROM Fixed_Deposit
ORDER BY interest_rate DESC
LIMIT 1;

--  7. Count the number of active deposits:
SELECT COUNT(*) AS active_fd_count
FROM Fixed_Deposit
WHERE status = 'Active';

-- 8. Get all deposits starting in 2023:
SELECT * FROM Fixed_Deposit
WHERE EXTRACT(YEAR FROM start_date) = 2023;

-- 9. Show nominee names and deposit amounts for closed accounts:
SELECT nominee_name, amount
FROM Fixed_Deposit
WHERE status = 'Closed';

-- 10. Show total FD amount bank-wise:
SELECT bank_id, SUM(amount) AS total_fd_amount
FROM Fixed_Deposit
GROUP BY bank_id;

-- 11. Update status of FD ID 4 to 'Closed':
UPDATE Fixed_Deposit
SET status = 'Closed'
WHERE fd_id = 4;

-- 12. Increase interest rate by 0.25 for all active deposits:
UPDATE Fixed_Deposit
SET interest_rate = interest_rate + 0.25
WHERE status = 'Active';

-- 13. Change nominee name for FD ID 10:
UPDATE Fixed_Deposit
SET nominee_name = 'Rachel Adams'
WHERE fd_id = 10;

-- 14. Extend maturity date of FD ID 2 by 1 year:
UPDATE Fixed_Deposit
SET maturity_date = DATE_ADD(maturity_date, INTERVAL 1 YEAR)
WHERE fd_id = 2;

-- 15. Reduce amount by 5000 for customer_id 6:
UPDATE Fixed_Deposit
SET amount = amount - 5000
WHERE customer_id = 6;

-- 16. Delete fixed deposit with fd_id = 19:
DELETE FROM Fixed_Deposit
WHERE fd_id = 19;

-- 17. Delete all fixed deposits that are closed:
DELETE FROM Fixed_Deposit
WHERE status = 'Closed';

-- 18. Add a column for FD type (e.g., 'Standard', 'Tax-saving'):
ALTER TABLE Fixed_Deposit
ADD fd_type VARCHAR(50);

-- 19. Rename column amount to deposit_amount:
ALTER TABLE Fixed_Deposit
RENAME COLUMN amount TO deposit_amount;

-- 20. Change data type of interest_rate to DECIMAL(5,2):
ALTER TABLE Fixed_Deposit
MODIFY interest_rate DECIMAL(5,2);

-- 17. Insurance

CREATE TABLE Insurance (
    policy_id INT PRIMARY KEY,
    customer_id INT,
    policy_type VARCHAR(50),
    provider_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    premium_amount DECIMAL(10,2) CHECK (premium_amount > 0),
    sum_assured DECIMAL(15,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

INSERT INTO Insurance VALUES 
(1, 1, 'Life', 'LIC', '2022-01-01', '2042-01-01', 15000.00, 1000000.00, 'Active'),
(2, 2, 'Health', 'Star Health', '2023-06-15', '2026-06-14', 8000.00, 500000.00, 'Active'),
(3, 3, 'Vehicle', 'ICICI Lombard', '2024-02-01', '2025-02-01', 4000.00, 300000.00, 'Active'),
(4, 4, 'Travel', 'TATA AIG', '2024-07-01', '2024-07-30', 1200.00, 100000.00, 'Expired'),
(5, 5, 'Home', 'HDFC ERGO', '2021-05-10', '2026-05-10', 10000.00, 2000000.00, 'Active'),
(6, 6, 'Life', 'Max Life', '2020-01-01', '2040-01-01', 18000.00, 1200000.00, 'Active'),
(7, 7, 'Health', 'Religare', '2022-12-01', '2025-11-30', 7000.00, 400000.00, 'Active'),
(8, 8, 'Life', 'SBI Life', '2023-03-15', '2043-03-15', 16000.00, 1100000.00, 'Active'),
(9, 9, 'Health', 'ICICI Prudential', '2023-01-01', '2026-01-01', 9000.00, 600000.00, 'Lapsed'),
(10, 10, 'Vehicle', 'Bajaj Allianz', '2023-09-01', '2024-09-01', 4500.00, 250000.00, 'Active'),
(11, 11, 'Home', 'Bharti AXA', '2020-10-10', '2025-10-10', 9500.00, 1500000.00, 'Active'),
(12, 12, 'Travel', 'Future Generali', '2024-01-01', '2024-01-15', 1100.00, 75000.00, 'Expired'),
(13, 13, 'Life', 'Kotak Life', '2021-05-05', '2041-05-05', 15500.00, 1050000.00, 'Active'),
(14, 14, 'Health', 'Aditya Birla Health', '2022-03-01', '2025-02-28', 8500.00, 550000.00, 'Lapsed'),
(15, 15, 'Vehicle', 'TATA AIG', '2023-07-20', '2024-07-20', 5000.00, 275000.00, 'Active'),
(16, 16, 'Home', 'SBI General', '2022-11-11', '2027-11-11', 11000.00, 1800000.00, 'Active'),
(17,17, 'Life', 'PNB MetLife', '2022-08-01', '2042-08-01', 17000.00, 1150000.00, 'Active'),
(18, 18, 'Travel', 'ICICI Lombard', '2024-06-01', '2024-06-15', 1300.00, 85000.00, 'Expired'),
(19, 19, 'Health', 'HDFC ERGO', '2023-10-10', '2026-10-10', 9200.00, 620000.00, 'Active'),
(20, 20, 'Vehicle', 'United India', '2023-01-01', '2024-01-01', 3900.00, 280000.00, 'Expired');

TRUNCATE TABLE Insurance;
DROP TABLE Insurance;

-- QUIRES:

-- 1. Show all insurance records:
SELECT * FROM Insurance;

-- 2. Show all active insurance policies:
SELECT * FROM Insurance
WHERE status = 'Active';

-- 3. Show all expired insurance policies:
SELECT * FROM Insurance
WHERE status = 'Expired';

-- 4. Show all lapsed insurance policies:
SELECT * FROM Insurance
WHERE status = 'Lapsed';

-- 5. Get all life insurance policies:
SELECT * FROM Insurance
WHERE insurance_type = 'Life';

-- 6. Find policies with premium over ₹10,000:
SELECT * FROM Insurance
WHERE premium_amount > 10000;

-- 7. Get insurance details for customer_id = 5:
SELECT * FROM Insurance
WHERE customer_id = 5;

-- 8. Show company-wise insurance count:
SELECT company_name, COUNT(*) AS total_policies
FROM Insurance
GROUP BY company_name;

-- 9. Show insurance policies valid beyond 2030:
SELECT * FROM Insurance
WHERE end_date > '2030-01-01';

-- 10. Find the insurance with the highest sum insured:
SELECT * FROM Insurance
ORDER BY sum_insured DESC
LIMIT 1;

-- 11. Update status of policy ID 9 to 'Active':
UPDATE Insurance
SET status = 'Active'
WHERE insurance_id = 9;

-- 12. Increase premium by ₹500 for all vehicle insurance:
UPDATE Insurance
SET premium_amount = premium_amount + 500
WHERE insurance_type = 'Vehicle';

-- 13. Change company name to 'TATA General' for policy ID 15:
UPDATE Insurance
SET company_name = 'TATA General'
WHERE insurance_id = 15;

-- 14. Extend end date by 1 year for insurance ID 10:
UPDATE Insurance
SET end_date = DATE_ADD(end_date, INTERVAL 1 YEAR)
WHERE insurance_id = 10;

-- 15. Reduce sum insured by ₹10,000 for expired policies:
UPDATE Insurance
SET sum_insured = sum_insured - 10000
WHERE status = 'Expired';

-- 16. Delete insurance policy ID 20:
DELETE FROM Insurance
WHERE insurance_id = 20;

-- 17. Delete all travel insurance records:
DELETE FROM Insurance
WHERE insurance_type = 'Travel';

-- 18. Add a column for policy number:
ALTER TABLE Insurance
ADD policy_number VARCHAR(30);

-- 19. Rename column sum_insured to coverage_amount:
ALTER TABLE Insurance
RENAME COLUMN sum_insured TO coverage_amount;

-- 20. Change data type of premium_amount to DECIMAL(10,2):
ALTER TABLE Insurance
MODIFY premium_amount DECIMAL(10,2);

-- 18. Cheque_Book

CREATE TABLE Cheque_Book (
    cheque_book_id INT PRIMARY KEY,
    account_id INT,
    issue_date DATE ,
    number_of_leaves INT CHECK (number_of_leaves > 0),
    start_cheque_number INT,
    end_cheque_number INT,
    status VARCHAR(20),
    issued_by VARCHAR(100),
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

INSERT INTO Cheque_Book VALUES
(1, 1, '2024-01-01', 25, 100001, 100025, 'Active', 'Branch Manager'),
(2, 2, '2024-02-15', 50, 100026, 100075, 'Used', 'Branch Assistant'),
(3, 3, '2024-03-10', 25, 100076, 100100, 'Cancelled', 'Branch Manager'),
(4, 4, '2024-04-01', 25, 100101, 100125, 'Active', 'Branch Clerk'),
(5, 5, '2024-04-20', 50, 100126, 100175, 'Used', 'Branch Manager'),
(6, 6, '2024-05-01', 25, 100176, 100200, 'Active', 'Branch Officer'),
(7, 7, '2024-05-10', 25, 100201, 100225, 'Used', 'Branch Manager'),
(8, 8, '2024-06-01', 50, 100226, 100275, 'Cancelled', 'Branch Assistant'),
(9, 9, '2024-06-05', 25, 100276, 100300, 'Active', 'Branch Manager'),
(10, 10, '2024-06-15', 25, 100301, 100325, 'Active', 'Branch Officer'),
(11, 11, '2024-07-01', 50, 100326, 100375, 'Used', 'Branch Manager'),
(12, 12, '2024-07-05', 25, 100376, 100400, 'Active', 'Branch Clerk'),
(13, 13, '2024-07-10', 25, 100401, 100425, 'Used', 'Branch Assistant'),
(14, 14, '2024-07-20', 50, 100426, 100475, 'Active', 'Branch Manager'),
(15, 15, '2024-08-01', 25, 100476, 100500, 'Cancelled', 'Branch Manager'),
(16, 16, '2024-08-05', 25, 100501, 100525, 'Active', 'Branch Officer'),
(17, 17, '2024-08-10', 50, 100526, 100575, 'Used', 'Branch Manager'),
(18, 18, '2024-08-15', 25, 100576, 100600, 'Active', 'Branch Clerk'),
(19, 19, '2024-08-20', 25, 100601, 100625, 'Active', 'Branch Assistant'),
(20, 20, '2024-08-22', 50, 100626, 100675, 'Active', 'Branch Officer');

TRUNCATE TABLE  Cheque_Book;
DROP TABLE  Cheque_Book;

-- QURIES:

-- 1. Show all cheque book records:
SELECT * FROM Cheque_Book;

-- 2. Get all active cheque books:
SELECT * FROM Cheque_Book
WHERE status = 'Active';

-- 3. List all cancelled cheque books:
SELECT * FROM Cheque_Book
WHERE status = 'Cancelled';

-- 4. Find cheque books issued by 'Branch Manager':
SELECT * FROM Cheque_Book
WHERE issued_by = 'Branch Manager';

-- 5. Show cheque books with more than 25 leaves:
SELECT * FROM Cheque_Book
WHERE total_leaves > 25;

-- 6. Get cheque book for customer_id = 10:
SELECT * FROM Cheque_Book
WHERE customer_id = 10;

-- 7. Show total leaves per status type:
SELECT status, SUM(total_leaves) AS total_leaves
FROM Cheque_Book
GROUP BY status;

-- 8. List cheque books issued in August 2024:
SELECT * FROM Cheque_Book
WHERE issue_date BETWEEN '2024-08-01' AND '2024-08-31';

-- 9. Get cheque books with number range above 100500:
SELECT * FROM Cheque_Book
WHERE cheque_start_number > 100500;

-- 10. Find the latest issued cheque book:
SELECT * FROM Cheque_Book
ORDER BY issue_date DESC
LIMIT 1;

-- 11. Change status of cheque book ID 3 to 'Active':
UPDATE Cheque_Book
SET status = 'Active'
WHERE cheque_book_id = 3;

-- 12. Update issued_by to 'Senior Officer' for ID 5:
UPDATE Cheque_Book
SET issued_by = 'Senior Officer'
WHERE cheque_book_id = 5;

-- 13. Add 5 more leaves to cheque book ID 6:
UPDATE Cheque_Book
SET total_leaves = total_leaves + 5
WHERE cheque_book_id = 6;

-- 14. Set status = 'Used' for cheque books issued before May 2024:
UPDATE Cheque_Book
SET status = 'Used'
WHERE issue_date < '2024-05-01';

-- 15. Change issued_by to 'Assistant Manager' for all cancelled cheque books:
UPDATE Cheque_Book
SET issued_by = 'Assistant Manager'
WHERE status = 'Cancelled';

-- 16. Delete cheque book with ID = 15:
DELETE FROM Cheque_Book
WHERE cheque_book_id = 15;

-- 17. Delete all cancelled cheque books:
DELETE FROM Cheque_Book
WHERE status = 'Cancelled';

-- 18. Add a column for remarks:
ALTER TABLE Cheque_Book
ADD remarks VARCHAR(100);

-- 19. Rename total_leaves to number_of_leaves:
ALTER TABLE Cheque_Book
RENAME COLUMN total_leaves TO number_of_leaves;

-- 20. Modify status column to allow longer text:
ALTER TABLE Cheque_Book
MODIFY status VARCHAR(20);
 
-- 19. Beneficiary

CREATE TABLE Beneficiary (
    beneficiary_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    bank_name VARCHAR(100),
    ifsc_code VARCHAR(11),
    account_number VARCHAR(20),
    added_on DATE ,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

INSERT INTO Beneficiary VALUES
(1, 1, 'Ravi Kumar', 'HDFC Bank', 'HDFC0001234', '123456789012', '2024-01-10', TRUE),
(2, 2, 'Anita Sharma', 'SBI', 'SBIN0005678', '987654321000', '2024-01-15', TRUE),
(3, 3, 'Vikram Patel', 'ICICI Bank', 'ICIC0007890', '112233445566', '2024-02-01', TRUE),
(4, 4, 'Kiran Rao', 'Axis Bank', 'UTIB0004567', '223344556677', '2024-02-10', FALSE),
(5, 5, 'Mohan Das', 'Punjab National Bank', 'PUNB0123456', '334455667788', '2024-03-01', TRUE),
(6, 6, 'Priya Verma', 'Yes Bank', 'YESB0007890', '445566778899', '2024-03-05', TRUE),
(7, 7, 'Arun Jain', 'Kotak Mahindra Bank', 'KKBK0001234', '556677889900', '2024-03-15', TRUE),
(8, 8, 'Sana Sheikh', 'Canara Bank', 'CNRB0001111', '667788990011', '2024-04-01', TRUE),
(9, 9, 'Rajeev Mehta', 'Union Bank', 'UBIN0556789', '778899001122', '2024-04-05', FALSE),
(10, 10, 'Deepa Joshi', 'Bank of Baroda', 'BARB0XYZ999', '889900112233', '2024-04-10', TRUE),
(11, 11, 'Nilesh Pandey', 'IDFC Bank', 'IDFB0012345', '990011223344', '2024-05-01', TRUE),
(12, 12, 'Megha Iyer', 'Federal Bank', 'FDRL0005678', '101112131415', '2024-05-05', TRUE),
(13, 13, 'Ajay Menon', 'IndusInd Bank', 'INDB0001234', '121314151617', '2024-05-10', TRUE),
(14, 14, 'Ritika Shah', 'HSBC Bank', 'HSBC0002345', '131415161718', '2024-05-15', FALSE),
(15, 15, 'Karthik Rao', 'City Union Bank', 'CIUB0009876', '141516171819', '2024-06-01', TRUE),
(16, 16, 'Farhan Ali', 'RBL Bank', 'RATN0004567', '151617181920', '2024-06-05', TRUE),
(17, 17, 'Sneha Kapoor', 'DBS Bank', 'DBSS0IN0811', '161718192021', '2024-06-10', TRUE),
(18, 18, 'Yashwant Singh', 'South Indian Bank', 'SIBL0001234', '171819202122', '2024-06-15', TRUE),
(19, 19, 'Divya Mishra', 'Bank of India', 'BKID0001234', '181920212223', '2024-06-20', TRUE),
(20, 20, 'Rohan Desai', 'Dena Bank', 'BKDN0004567', '192021222324', '2024-06-25', FALSE);

TRUNCATE TABLE Beneficiary;
DROP TABLE Beneficiary;

-- QURIES:

-- 1. View all beneficiaries:
SELECT * FROM Beneficiary;

-- 2. Show only active beneficiaries:
SELECT * FROM Beneficiary
WHERE is_active = TRUE;

-- 3. Show inactive beneficiaries:
SELECT * FROM Beneficiary
WHERE is_active = FALSE;

-- 4. Find beneficiaries from SBI bank:
SELECT * FROM Beneficiary
WHERE bank_name = 'SBI';

-- 5. Show beneficiaries added after '2024-04-01':
SELECT * FROM Beneficiary
WHERE added_on > '2024-04-01';

-- 6. Get beneficiary by name 'Sneha Kapoor':
SELECT * FROM Beneficiary
WHERE name = 'Sneha Kapoor';

-- 7. Count of active beneficiaries:
SELECT COUNT(*) AS active_count
FROM Beneficiary
WHERE is_active = TRUE;

-- 8. List beneficiaries with Aadhar starting with '1':
SELECT * FROM Beneficiary
WHERE aadhar_number LIKE '1%';

-- 9. Show beneficiary details with IFSC code 'INDB0001234':
SELECT * FROM Beneficiary
WHERE ifsc_code = 'INDB0001234';

-- 10. Sort beneficiaries by added date:
SELECT * FROM Beneficiary
ORDER BY added_on DESC;

-- 11. Set beneficiary ID 4 as active:
UPDATE Beneficiary
SET is_active = TRUE
WHERE beneficiary_id = 4;

-- 12. Change bank name for ID 10 to 'ICICI Bank':
UPDATE Beneficiary
SET bank_name = 'ICICI Bank'
WHERE beneficiary_id = 10;

-- 13. Update Aadhar number for beneficiary ID 5:
UPDATE Beneficiary
SET aadhar_number = '000000000000'
WHERE beneficiary_id = 5;

-- 14. Deactivate all beneficiaries from 'HSBC Bank':
UPDATE Beneficiary
SET is_active = FALSE
WHERE bank_name = 'HSBC Bank';

-- 15. Update IFSC code of beneficiary ID 3:
UPDATE Beneficiary
SET ifsc_code = 'ICIC0009999'
WHERE beneficiary_id = 3;

-- 16. Delete beneficiary with ID = 15:
DELETE FROM Beneficiary
WHERE beneficiary_id = 15;

-- 17. Delete all inactive beneficiaries:
DELETE FROM Beneficiary
WHERE is_active = FALSE;

-- 18. Add a column for mobile number:
ALTER TABLE Beneficiary
ADD mobile_number VARCHAR(15);

-- 19. Rename is_active to status_active:
ALTER TABLE Beneficiary
RENAME COLUMN is_active TO status_active;

-- 20. Change length of Aadhar number column:
ALTER TABLE Beneficiary
MODIFY aadhar_number VARCHAR(20);

-- 20. Mobile_Banking

CREATE TABLE Mobile_Banking (
    mb_id INT PRIMARY KEY,
    customer_id INT,
    registered_mobile VARCHAR(15) NOT NULL,
    device_id VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    registered_on DATE ,
    last_login TIMESTAMP,
    login_attempts INT DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

INSERT INTO Mobile_Banking VALUES
(1, 1, '9876543210', 'device_001', TRUE, '2024-01-05', '2024-08-20 10:15:00', 0),
(2, 2, '9876543211', 'device_002', TRUE, '2024-01-10', '2024-08-21 09:45:00', 1),
(3, 3, '9876543212', 'device_003', TRUE, '2024-02-01', '2024-08-22 08:30:00', 0),
(4, 4, '9876543213', 'device_004', FALSE, '2024-02-10', NULL, 3),
(5, 5, '9876543214', 'device_005', TRUE, '2024-03-05', '2024-08-23 07:15:00', 0),
(6, 6, '9876543215', 'device_006', TRUE, '2024-03-15', '2024-08-22 12:00:00', 0),
(7, 7, '9876543216', 'device_007', TRUE, '2024-04-01', '2024-08-24 06:45:00', 2),
(8, 8, '9876543217', 'device_008', FALSE, '2024-04-10', NULL, 5),
(9, 9, '9876543218', 'device_009', TRUE, '2024-05-01', '2024-08-20 11:10:00', 0),
(10, 10, '9876543219', 'device_010', TRUE, '2024-05-15', '2024-08-21 13:00:00', 1),
(11, 11, '9876543220', 'device_011', TRUE, '2024-06-01', '2024-08-22 14:30:00', 0),
(12, 12, '9876543221', 'device_012', TRUE, '2024-06-10', '2024-08-23 15:20:00', 0),
(13, 13, '9876543222', 'device_013', FALSE, '2024-06-20', NULL, 2),
(14, 14, '9876543223', 'device_014', TRUE, '2024-07-01', '2024-08-24 16:00:00', 0),
(15, 15, '9876543224', 'device_015', TRUE, '2024-07-10', '2024-08-22 17:30:00', 1),
(16, 16, '9876543225', 'device_016', TRUE, '2024-07-15', '2024-08-21 18:45:00', 0),
(17, 17, '9876543226', 'device_017', TRUE, '2024-07-20', '2024-08-20 19:10:00', 0),
(18, 18, '9876543227', 'device_018', TRUE, '2024-07-25', '2024-08-24 20:00:00', 0),
(19, 19, '9876543228', 'device_019', FALSE, '2024-08-01', NULL, 4),
(20, 20, '9876543229', 'device_020', TRUE, '2024-08-10', '2024-08-24 21:15:00', 0);

TRUNCATE TABLE Mobile_Banking ;
DROP TABLE Mobile_Banking ;

-- QURIES:


-- 21. Net_Banking

CREATE TABLE Net_Banking (
    nb_id INT PRIMARY KEY,
    customer_id INT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    last_login TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    security_question VARCHAR(255),
    security_answer_hash VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

INSERT INTO Net_Banking VALUES
(1, 1, 'ravi_kumar', 'hash_pwd1', '2024-08-22 10:00:00', TRUE, 'Mother\'s maiden name?', 'hash_ans1'),
(2, 2, 'anita_sharma', 'hash_pwd2', '2024-08-21 09:30:00', TRUE, 'First pet\'s name?', 'hash_ans2'),
(3, 3, 'vikram_p', 'hash_pwd3', '2024-08-20 11:15:00', TRUE, 'Favorite teacher?', 'hash_ans3'),
(4, 4, 'kiran_rao', 'hash_pwd4', NULL, FALSE, 'Birthplace?', 'hash_ans4'),
(5, 5, 'mohan_das', 'hash_pwd5', '2024-08-19 08:45:00', TRUE, 'Favorite color?', 'hash_ans5'),
(6, 6, 'priya_verma', 'hash_pwd6', '2024-08-18 14:10:00', TRUE, 'Best friend\'s name?', 'hash_ans6'),
(7, 7, 'arun_jain', 'hash_pwd7', NULL, FALSE, 'School name?', 'hash_ans7'),
(8, 8, 'sana_sheikh', 'hash_pwd8', '2024-08-17 16:00:00', TRUE, 'Favorite food?', 'hash_ans8'),
(9, 9, 'rajeev_m', 'hash_pwd9', NULL, FALSE, 'Childhood nickname?', 'hash_ans9'),
(10, 10, 'deepa_joshi', 'hash_pwd10', '2024-08-16 12:25:00', TRUE, 'Dream job?', 'hash_ans10'),
(11, 11, 'nilesh_p', 'hash_pwd11', '2024-08-15 10:45:00', TRUE, 'First car model?', 'hash_ans11'),
(12, 12, 'megha_iyer', 'hash_pwd12', NULL, TRUE, 'Favorite book?', 'hash_ans12'),
(13, 13, 'ajay_menon', 'hash_pwd13', '2024-08-14 15:00:00', TRUE, 'Favorite actor?', 'hash_ans13'),
(14, 14, 'ritika_shah', 'hash_pwd14', NULL, FALSE, 'Street you grew up on?', 'hash_ans14'),
(15, 15, 'karthik_rao', 'hash_pwd15', '2024-08-13 18:00:00', TRUE, 'First employer?', 'hash_ans15'),
(16, 16, 'farhan_ali', 'hash_pwd16', '2024-08-12 08:00:00', TRUE, 'First school?', 'hash_ans16'),
(17, 17, 'sneha_kapoor', 'hash_pwd17', '2024-08-11 09:45:00', TRUE, 'Favorite holiday spot?', 'hash_ans17'),
(18, 18, 'yash_singh', 'hash_pwd18', NULL, FALSE, 'Favorite sport?', 'hash_ans18'),
(19, 19, 'divya_mishra', 'hash_pwd19', '2024-08-10 11:00:00', TRUE, 'First bike?', 'hash_ans19'),
(20, 20, 'rohan_desai', 'hash_pwd20', '2024-08-09 13:15:00', TRUE, 'Name of college?', 'hash_ans20');

SELECT * FROM  Net_Banking;
TRUNCATE TABLE  Net_Banking;
DROP TABLE  Net_Banking;

-- 22. Complaint

CREATE TABLE Complaint (
    complaint_id INT PRIMARY KEY,
    customer_id INT,
    complaint_type VARCHAR(50),
    description TEXT,
    status VARCHAR(20) DEFAULT 'Open',
    lodged_on DATE ,
    resolved_on DATE,
    resolved_by VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

INSERT INTO Complaint VALUES
(1, 1, 'ATM Issue', 'ATM did not dispense cash but amount debited.', 'Resolved', '2024-01-10', '2024-01-12', 'Branch Manager'),
(2, 2, 'Net Banking', 'Unable to reset login password.', 'Closed', '2024-01-12', '2024-01-13', 'IT Support'),
(3, 3, 'Mobile App', 'App crashes on login screen.', 'In Progress', '2024-02-01', NULL, NULL),
(4, 4, 'Cheque Issue', 'Cheque deposited but not credited.', 'Open', '2024-02-05', NULL, NULL),
(5, 5, 'Loan Query', 'Incorrect EMI deduction.', 'Resolved', '2024-02-10', '2024-02-12', 'Loan Officer'),
(6, 6, 'Card Block', 'Debit card blocked without request.', 'Closed', '2024-02-15', '2024-02-16', 'Customer Service'),
(7, 7, 'KYC Issue', 'PAN details not updated.', 'Resolved', '2024-03-01', '2024-03-03', 'KYC Desk'),
(8, 8, 'Unauthorized Transaction', 'Transaction not done by me.', 'In Progress', '2024-03-05', NULL, NULL),
(9, 9, 'SMS Alerts', 'Not receiving transaction alerts.', 'Open', '2024-03-10', NULL, NULL),
(10, 10, 'UPI Issue', 'Money deducted but not received by beneficiary.', 'Resolved', '2024-03-12', '2024-03-14', 'Digital Banking Support'),
(11, 11, 'Branch Service', 'Staff was uncooperative.', 'Closed', '2024-03-15', '2024-03-17', 'Branch Head'),
(12, 12, 'Account Statement', 'Monthly statement not received.', 'Resolved', '2024-03-20', '2024-03-22', 'Customer Desk'),
(13, 13, 'Interest Discrepancy', 'Incorrect interest credited.', 'In Progress', '2024-04-01', NULL, NULL),
(14, 14, 'Fixed Deposit', 'FD prematurely closed without consent.', 'Open', '2024-04-05', NULL, NULL),
(15, 15, 'App Login', 'Two-factor authentication failed.', 'Resolved', '2024-04-10', '2024-04-12', 'App Support'),
(16, 16, 'Cheque Bounce', 'Cheque bounced despite sufficient funds.', 'Closed', '2024-04-15', '2024-04-16', 'Accounts Officer'),
(17, 17, 'Card Delivery', 'Credit card not received.', 'Resolved', '2024-04-20', '2024-04-25', 'Card Desk'),
(18, 18, 'Loan Prepayment', 'Charges applied despite no penalty clause.', 'In Progress', '2024-05-01', NULL, NULL),
(19, 19, 'Net Banking Locked', 'Account locked after failed attempts.', 'Open', '2024-05-05', NULL, NULL),
(20, 20, 'Mobile Number Update', 'New number not reflecting.', 'Resolved', '2024-05-10', '2024-05-12', 'Customer Support');

SELECT * FROM Complaint;
TRUNCATE TABLE Complaint;
DROP TABLE Complaint;

-- 23. Audit_Log

CREATE TABLE Audit_Log (
    log_id INT PRIMARY KEY,
    user_id INT,
    action VARCHAR(100),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    table_affected VARCHAR(50),
    row_id INT,
    ip_address VARCHAR(50),
    status VARCHAR(20),
    remarks TEXT
);

INSERT INTO Audit_Log VALUES
(1, 1, 'INSERT', '2024-08-20 09:15:00', 'Customers', 501, '192.168.1.1', 'Success', 'New customer created.'),
(2, 2, 'UPDATE', '2024-08-20 09:30:00', 'Accounts', 210, '192.168.1.2', 'Success', 'Updated account balance.'),
(3, 3, 'DELETE', '2024-08-20 09:45:00', 'Beneficiary', 14, '192.168.1.3', 'Success', 'Removed inactive beneficiary.'),
(4, 4, 'UPDATE', '2024-08-20 10:00:00', 'Loans', 77, '192.168.1.4', 'Failure', 'Permission denied.'),
(5, 5, 'INSERT', '2024-08-20 10:15:00', 'Complaints', 19, '192.168.1.5', 'Success', 'New complaint lodged.'),
(6, 6, 'LOGIN', '2024-08-20 10:20:00', 'Users', 1001, '192.168.1.1', 'Success', 'User login successful.'),
(7, 7, 'LOGIN', '2024-08-20 10:30:00', 'Users', 1005, '192.168.1.6', 'Failure', 'Wrong credentials.'),
(8, 8, 'UPDATE', '2024-08-20 10:45:00', 'Mobile_Banking', 18, '192.168.1.2', 'Success', 'Device ID changed.'),
(10, 10, 'DELETE', '2024-08-20 11:15:00', 'Net_Banking', 9, '192.168.1.7', 'Failure', 'Unauthorized operation.'),
(11, 11, 'INSERT', '2024-08-20 11:30:00', 'Insurance', 5, '192.168.1.8', 'Success', 'New life insurance policy added.'),
(12, 12, 'UPDATE', '2024-08-20 11:45:00', 'Customers', 512, '192.168.1.5', 'Success', 'KYC details updated.'),
(13, 13, 'UPDATE', '2024-08-20 12:00:00', 'Accounts', 305, '192.168.1.6', 'Pending', 'Balance update waiting for approval.'),
(14, 14, 'INSERT', '2024-08-20 12:15:00', 'Beneficiary', 17, '192.168.1.1', 'Success', 'Added new beneficiary.'),
(15, 15, 'LOGIN', '2024-08-20 12:30:00', 'Users', 1002, '192.168.1.2', 'Success', 'Login successful.'),
(16, 16, 'LOGOUT', '2024-08-20 12:45:00', 'Users', 1003, '192.168.1.4', 'Success', 'User logged out.'),
(17, 17, 'RESET_PASSWORD', '2024-08-20 13:00:00', 'Net_Banking', 7, '192.168.1.6', 'Success', 'Password reset successful.'),
(18, 18, 'INSERT', '2024-08-20 13:15:00', 'Complaints', 20, '192.168.1.7', 'Success', 'Complaint lodged successfully.'),
(19, 19, 'DELETE', '2024-08-20 13:30:00', 'Loans', 80, '192.168.1.5', 'Failure', 'Loan ID not found.'),
(20, 20, 'UPDATE', '2024-08-20 13:45:00', 'Mobile_Banking', 19, '192.168.1.1', 'Success', 'Login attempts reset.');

-- 24. Notification

CREATE TABLE Notification (
    notification_id INT PRIMARY KEY,
    customer_id INT,
    message TEXT NOT NULL,
    type VARCHAR(50),
    sent_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    channel VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

INSERT INTO Notification (notification_id, customer_id, message, type, sent_on, is_read, channel) VALUES
(1, 1, 'Your account statement for July is ready.', 'Account Update', '2024-08-20 09:00:00', FALSE, 'Email'),
(2, 2, 'New login detected from unrecognized device.', 'Security Alert', '2024-08-20 09:10:00', TRUE, 'App'),
(3, 3, 'Your loan EMI of ₹15,000 is due on 30th August.', 'Loan Reminder', '2024-08-19 18:00:00', FALSE, 'SMS'),
(4, 4, 'Cheque number 123456 has been cleared.', 'Cheque Update', '2024-08-20 08:30:00', TRUE, 'Email'),
(5, 5, 'Your mobile banking registration is successful.', 'Registration', '2024-08-18 14:20:00', TRUE, 'Push'),
(6, 6, 'Credit card bill payment received.', 'Payment Confirmation', '2024-08-17 11:15:00', TRUE, 'App'),
(7, 7, 'Your net banking password was changed.', 'Security Alert', '2024-08-16 10:05:00', FALSE, 'Email'),
(8, 8, 'New beneficiary added to your account.', 'Beneficiary Update', '2024-08-15 09:50:00', FALSE, 'SMS'),
(9, 9, 'Your FD matured on 15th August.', 'FD Notification', '2024-08-15 08:00:00', TRUE, 'Push'),
(10, 10, 'Your debit card has been blocked as per your request.', 'Card Status', '2024-08-14 07:45:00', TRUE, 'Email'),
(11, 11, 'Monthly interest has been credited to your savings account.', 'Interest Credit', '2024-08-13 13:00:00', FALSE, 'App'),
(12, 12, 'Your account password was reset successfully.', 'Security Alert', '2024-08-12 12:30:00', TRUE, 'Email'),
(13, 13, 'Loan application approved.', 'Loan Status', '2024-08-11 11:45:00', FALSE, 'SMS'),
(14, 14, 'Your cheque book request has been processed.', 'Cheque Update', '2024-08-10 10:15:00', TRUE, 'Push'),
(15, 15, 'Failed login attempt detected.', 'Security Alert', '2024-08-09 09:05:00', FALSE, 'App'),
(16, 16, 'Your account has been credited with ₹10,000.', 'Account Update', '2024-08-08 08:55:00', TRUE, 'Email'),
(17, 17, 'Mobile number updated successfully.', 'Profile Update', '2024-08-07 07:45:00', TRUE, 'SMS'),
(18, 18, 'New terms and conditions have been updated.', 'Information', '2024-08-06 06:35:00', FALSE, 'Email'),
(19, 19, 'Your complaint has been resolved.', 'Complaint Update', '2024-08-05 05:25:00', TRUE, 'Push'),
(20, 20, 'Your savings account has been opened.', 'Account Update', '2024-08-04 04:15:00', FALSE, 'App');

SELECT * FROM  Notification;
TRUNCATE TABLE  Notification;
DROP TABLE  Notification;

-- 25. Admin_User

CREATE TABLE Admin_User (
    admin_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(50) DEFAULT 'Auditor',
    email VARCHAR(100) UNIQUE,
    contact_number VARCHAR(15),
    created_on DATE ,
    last_login TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

INSERT INTO Admin_User (admin_id, username, password_hash, role, email, contact_number, created_on, last_login, is_active) VALUES
(1, 'admin_ravi', 'hash_pwd1', 'Administrator', 'ravi.admin@example.com', '9876543210', '2023-01-10', '2024-08-20 09:00:00', TRUE),
(2, 'auditor_anita', 'hash_pwd2', 'Auditor', 'anita.auditor@example.com', '9876543211', '2023-02-12', '2024-08-19 16:15:00', TRUE),
(3, 'manager_vikram', 'hash_pwd3', 'Manager', 'vikram.manager@example.com', '9876543212', '2023-03-15', '2024-08-18 10:30:00', TRUE),
(4, 'support_kiran', 'hash_pwd4', 'Support', 'kiran.support@example.com', '9876543213', '2023-04-20', '2024-08-17 14:45:00', TRUE),
(5, 'admin_mohan', 'hash_pwd5', 'Administrator', 'mohan.admin@example.com', '9876543214', '2023-05-25', '2024-08-16 12:00:00', TRUE),
(6, 'auditor_priya', 'hash_pwd6', 'Auditor', 'priya.auditor@example.com', '9876543215', '2023-06-30', '2024-08-15 11:30:00', TRUE),
(7, 'manager_arun', 'hash_pwd7', 'Manager', 'arun.manager@example.com', '9876543216', '2023-07-10', '2024-08-14 13:20:00', TRUE),
(8, 'support_sana', 'hash_pwd8', 'Support', 'sana.support@example.com', '9876543217', '2023-08-05', '2024-08-13 09:40:00', TRUE),
(9, 'admin_rajeev', 'hash_pwd9', 'Administrator', 'rajeev.admin@example.com', '9876543218', '2023-09-12', '2024-08-12 15:25:00', TRUE),
(10, 'auditor_deepa', 'hash_pwd10', 'Auditor', 'deepa.auditor@example.com', '9876543219', '2023-10-18', '2024-08-11 14:10:00', TRUE),
(11, 'manager_nilesh', 'hash_pwd11', 'Manager', 'nilesh.manager@example.com', '9876543220', '2023-11-22', '2024-08-10 08:50:00', TRUE),
(12, 'support_megha', 'hash_pwd12', 'Support', 'megha.support@example.com', '9876543221', '2023-12-01', '2024-08-09 10:30:00', TRUE),
(13, 'admin_ajay', 'hash_pwd13', 'Administrator', 'ajay.admin@example.com', '9876543222', '2024-01-15', '2024-08-08 11:00:00', TRUE),
(14, 'auditor_ritika', 'hash_pwd14', 'Auditor', 'ritika.auditor@example.com', '9876543223', '2024-02-20', '2024-08-07 12:40:00', TRUE),
(15, 'manager_karthik', 'hash_pwd15', 'Manager', 'karthik.manager@example.com', '9876543224', '2024-03-25', '2024-08-06 09:15:00', TRUE),
(16, 'support_farhan', 'hash_pwd16', 'Support', 'farhan.support@example.com', '9876543225', '2024-04-30', '2024-08-05 14:50:00', TRUE),
(17, 'admin_sneha', 'hash_pwd17', 'Administrator', 'sneha.admin@example.com', '9876543226', '2024-05-05', '2024-08-04 13:00:00', TRUE),
(18, 'auditor_yash', 'hash_pwd18', 'Auditor', 'yash.auditor@example.com', '9876543227', '2024-06-10', '2024-08-03 10:10:00', TRUE),
(19, 'manager_divya', 'hash_pwd19', 'Manager', 'divya.manager@example.com', '9876543228', '2024-07-15', '2024-08-02 08:55:00', TRUE),
(20, 'support_rohan', 'hash_pwd20', 'Support', 'rohan.support@example.com', '9876543229', '2024-08-01', '2024-08-01 16:20:00', TRUE);

SELECT * FROM Admin_User;
TRUNCATE TABLE Admin_User;
DROP TABLE Admin_User;
