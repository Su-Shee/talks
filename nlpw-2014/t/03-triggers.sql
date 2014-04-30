-- pg_prove -U postgres -d tapcats 03-triggers.sql --verbose
-- psql -U postgres -d tapcats -Xf 03-triggers.sql

BEGIN;
SELECT plan(4);

SELECT has_function('my_timestamp');
SELECT function_lang_is('my_timestamp', 'plpgsql');
SELECT function_returns('my_timestamp', 'trigger');
SELECT trigger_is('traits', 'updated', 'my_timestamp');

SELECT * FROM finish();
ROLLBACK;
