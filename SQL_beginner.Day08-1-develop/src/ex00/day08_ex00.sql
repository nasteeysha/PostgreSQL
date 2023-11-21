-- Session 1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria where name = 'Pizza Hut';

-- Session 1
COMMIT;

-- Session 2
SELECT * FROM pizzeria where name = 'Pizza Hut';