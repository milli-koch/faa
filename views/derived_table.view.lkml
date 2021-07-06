view: derived_table {
 derived_table: {
  sql_trigger_value: SELECT * FROM ${FAKE_TABLE.SQL_TABLE_NAME} ;;
   sql: SELECT
    (CAST(`inventory_items`.`created_at` AS CHAR)) AS `inventory_items.created_time`,
        (DATE(`inventory_items`.`created_at`)) AS `inventory_items.created_date`,
        (DATE(`order_items`.`returned_at`)) AS `order_items.returned_date`,
        (CAST(`order_items`.`returned_at` AS CHAR)) AS `order_items.returned_time`,
        (CAST(`orders`.`created_at` AS CHAR)) AS `orders.created_time`,
        (CAST(`users`.`created_at` AS CHAR)) AS `users.created_time`
FROM
    `demo_db`.`order_items` AS `order_items`
    LEFT JOIN `demo_db`.`orders` AS `orders` ON `order_items`.`order_id` = `orders`.`id`
    LEFT JOIN `demo_db`.`inventory_items` AS `inventory_items` ON `order_items`.`inventory_item_id` = `inventory_items`.`id`
    LEFT JOIN `demo_db`.`users` AS `users` ON `orders`.`user_id` = `users`.`id`
GROUP BY
    (CAST(`order_items`.`returned_at` AS CHAR)),
    (CAST(`orders`.`created_at` AS CHAR)),
    (CAST(`inventory_items`.`created_at` AS CHAR)),
    (CAST(`users`.`created_at` AS CHAR)),
    2,
    3
ORDER BY
    (CAST(`inventory_items`.`created_at` AS CHAR)) DESC
LIMIT 500 ;;
 }

dimension: date_field {
  type: date
  sql: ${TABLE}.`inventory_items.created_date` ;;
}
}
