WITH inventory AS (
  SELECT
    purchase_items.wine_id,
    SUM(purchase_items.quantity) as quantity,
    purchase_items.location_id
  FROM purchase_items
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
