CREATE DATABASE finsight_banking;

CREATE TABLE IF NOT EXISTS banking_data (
        CustomerID VARCHAR(20) NOT NULL PRIMARY KEY,
        Age INT,
        AccountType VARCHAR(20),
        Balance FLOAT,
        OpenDate DATE,
        Status VARCHAR(20),
        CreditScore INT,
        Region VARCHAR(20),
        TransactionCount INT,
        HasLoan VARCHAR(5)
);


        -- Terminal examples to import CSV data into this table
   

        -- PostgreSQL using psql (adjust column order if needed):
        -- psql -U postgres -d finsight_banking -c "\copy banking_data(CustomerID,Age,AccountType,Balance,OpenDate,Status,CreditScore,Region,TransactionCount,HasLoan) FROM 'C:/Users/nscom/OneDrive/Desktop/github_publications/Finsight_Banking_Analytics_Project/data/cleaned_banking_data.csv' WITH CSV HEADER"

     

        -- Replace 'path/to/banking_data.csv' and credentials with actual values. Ensure CSV date format matches OpenDate column (YYYY-MM-DD).

