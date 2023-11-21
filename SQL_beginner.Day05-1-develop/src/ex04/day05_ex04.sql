CREATE UNIQUE INDEX idx_menu_unique on menu(pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYZE
SELECT *
FROM menu
WHERE pizza_name = 'cheese pizza' and pizzeria_id = 1;