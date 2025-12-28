WITH inventory AS (
  SELECT
    operations.wine_id,
    SUM(operations.quantity) as quantity,
    operations.location_id
  FROM operations
  GROUP BY wine_id, location_id

  UNION

  SELECT
    drinks.wine_id,
    SUM(drinks.quantity * -1) as quantity,
    drinks.location_id
  FROM drinks
  GROUP BY wine_id, location_id
),

temp_table AS (
  SELECT
    wine_id,
    SUM(quantity) AS quantity,
    location_id
  FROM inventory
  GROUP BY wine_id, location_id
)

SELECT
  wine_id,
  quantity,
  location_id
FROM temp_table
WHERE quantity <> 0;
