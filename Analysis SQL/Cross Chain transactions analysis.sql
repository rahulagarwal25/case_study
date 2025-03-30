SELECT
from_address,
to_address,
value / 1e18 AS eth_value,
block_number
FROM bigquery-public-data.crypto_ethereum.transactions
WHERE LOWER(to_address) IN (
'0x2c4bd064b998838076fa341a83d007fc2fa50957',
'0x5d22045daceab03b158031ecb7d9d06fad24609b'
)
ORDER BY block_number DESC
LIMIT 100;