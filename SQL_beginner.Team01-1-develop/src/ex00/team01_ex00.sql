WITH max_currency AS (
	SELECT id, max(updated) AS updated
	FROM currency
	GROUP BY id, name
),
c_cte AS (
	SELECT c.id, c.name, c.rate_to_usd, c.updated
	FROM currency AS c
	JOIN max_currency AS mc ON mc.id = c.id
	WHERE c.updated = mc.updated
)
SELECT coalesce(u.name, 'not defined') AS name,
	coalesce(u.lastname, 'not defined') AS lastname,
	b.type, SUM(b.money) AS volume,
	coalesce(c.name, 'not defined') AS currency_name,
	coalesce(c.rate_to_usd, 1) AS last_rate_to_usd,
	(SUM(b.money) * coalesce(c.rate_to_usd, 1))::real AS total_volume_in_usd
FROM balance AS b
LEFT JOIN "user" AS u ON u.id = b.user_id
LEFT JOIN c_cte AS c ON c.id = b.currency_id
GROUP BY 1, 2, 3, 5, 6
ORDER BY 1 DESC, 2, 3;

