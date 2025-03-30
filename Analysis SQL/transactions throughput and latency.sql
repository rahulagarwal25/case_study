SELECT AVG(confirmation_time_sec) AS avg_block_confirmation_time_sec 
FROM ( 
  SELECT number, timestamp, LAG(timestamp) OVER (ORDER BY number) AS prev_timestamp,
   TIMESTAMP_DIFF(timestamp, LAG(timestamp) OVER (ORDER BY number), SECOND) AS confirmation_time_sec 
   FROM bigquery-public-data.crypto_ethereum.blocks ) 
   WHERE confirmation_time_sec IS NOT NULL;