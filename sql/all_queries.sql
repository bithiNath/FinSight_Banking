-- count total active customers
SELECT COUNT(*) AS total_active_customers
FROM banking_data
WHERE status = 'Active';


-- average active customer balance
SELECT 
ROUND(AVG(Balance)::numeric, 0) AS average_active_customer_balance
FROM banking_data
WHERE status = 'Active';

-- loan penetration rate

SELECT
  ROUND(100.0 * SUM(CASE WHEN HasLoan = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS loan_penetration_percent 
FROM banking_data;


-- average credit score
SELECT
  ROUND(AVG(CreditScore)::numeric, 0) AS average_credit_score
FROM banking_data;

-- new accounts open in the last 12 months
SELECT
  COUNT(*) AS new_accounts_last_12_months
FROM banking_data
WHERE OpenDate >= CURRENT_DATE - INTERVAL '12 months';


-- account type distribution
SELECT
  AccountType,
  COUNT(*) AS account_count
FROM banking_data
GROUP BY AccountType
ORDER BY account_count DESC;

--total balance by region
SELECT
  Region,
  ROUND(SUM(Balance)::numeric, 2) AS total_balance
FROM banking_data
GROUP BY Region
ORDER BY total_balance DESC;

--loan ownership by status
SELECT
  Status,
  HasLoan,
  COUNT(*) AS count_customers
FROM banking_data
GROUP BY Status, Hasloan
ORDER BY Status, HasLoan DESC;

--monthly account openings trend
SELECT
  DATE_TRUNC('month', OpenDate) AS month,
  COUNT(*) AS accounts_opened
FROM banking_data
GROUP BY DATE_TRUNC('month', OpenDate)
ORDER BY month;

--average balance by creditscore band
SELECT
  CASE
    WHEN CreditScore < 600 THEN 'Under 600'
    WHEN CreditScore BETWEEN 600 AND 649 THEN '600-649'
    WHEN CreditScore BETWEEN 650 AND 699 THEN '650-699'
    WHEN CreditScore BETWEEN 700 AND 749 THEN '700-749'
    ELSE '750+'
  END AS creditscore_band,
  ROUND(AVG(Balance)::numeric, 2) AS average_balance
FROM banking_data
GROUP BY creditscore_band
ORDER BY MIN(CreditScore);

-- region vs average transaction count
SELECT
  Region,
  ROUND(AVG(TransactionCount)::numeric, 2) AS average_transaction_count
FROM banking_data
GROUP BY Region
ORDER BY average_transaction_count DESC;

-- customer count by account type and region
SELECT
  Region,
  AccountType,
  COUNT(*) AS customers
FROM banking_data
GROUP BY Region, AccountType
ORDER BY Region, customers DESC;

-- balance distribution by loan status
SELECT HasLoan, 
ROUND(AVG(Balance)::numeric, 2) AS avg_balance, 
MIN(Balance) AS min_balance, 
MAX(Balance) AS max_balance
FROM banking_data
GROUP BY HasLoan;


