SELECT 
  DATE(block_timestamp) AS transaction_date,
  AVG(gas_price) / 1e9 AS avg_gas_price_gwei
FROM `bigquery-public-data.crypto_ethereum.transactions`
GROUP BY transaction_date
ORDER BY transaction_date DESC
LIMIT 30;
