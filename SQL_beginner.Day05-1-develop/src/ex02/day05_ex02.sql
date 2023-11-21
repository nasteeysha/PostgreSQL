CREATE INDEX idx_person_name on person(upper(name));

SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYZE
SELECT *
FROM person
WHERE upper(name) = 'Kate';