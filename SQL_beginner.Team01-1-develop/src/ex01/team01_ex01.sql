-- insert into currency
-- values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency
-- values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH c_cte AS (
	SELECT id, name
	FROM currency
	GROUP BY id, name
)
SELECT coalesce(u.name, 'not defined') AS name,
	coalesce(u.lastname, 'not defined') AS lastname,
	c.name AS currency_name, (b.money *
	coalesce((SELECT rate_to_usd FROM currency AS cur
	 WHERE cur.id = c.id AND cur.updated < b.updated
	ORDER BY cur.updated DESC LIMIT 1),
			(SELECT rate_to_usd FROM currency AS cur
	 WHERE cur.id = c.id AND cur.updated >= b.updated
	ORDER BY cur.updated LIMIT 1)))::real AS currency_in_usd
FROM balance AS b
LEFT JOIN "user" AS u ON u.id = b.user_id
JOIN c_cte AS c ON c.id = b.currency_id
ORDER BY 1 DESC, 2, 3;
