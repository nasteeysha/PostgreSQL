INSERT INTO person_discounts ( id,person_id, pizzeria_id,discount)
SELECT row_number() OVER () AS id,
       amount.person_id,
       amount.pizzeria_id,
       CASE
           WHEN amount.orders = 1 THEN 10.5
           WHEN amount.orders = 2 THEN 22
           ELSE 30
           END AS discount
FROM (SELECT person_id, pizzeria_id, count(person_id) AS orders
      FROM person_order
               JOIN menu m on person_order.menu_id = m.id
      GROUP BY person_id, pizzeria_id) AS amount;
