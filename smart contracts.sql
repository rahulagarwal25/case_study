SELECT receipt_contract_address, COUNT(*) AS contract_deployments 
FROM bigquery-public-data.crypto_ethereum.transactions 
WHERE receipt_contract_address IS NOT NULL 
GROUP BY receipt_contract_address 
ORDER BY contract_deployments DESC LIMIT 10;