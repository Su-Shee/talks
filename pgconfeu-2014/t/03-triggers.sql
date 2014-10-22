-- pg_prove -U postgres -d kittycats 03-triggers.sql --verbose
-- psql -U postgres -d kittycats -Xf 03-triggers.sql

BEGIN;
SELECT plan(7);

SELECT has_function('my_timestamp');
SELECT function_lang_is('my_timestamp', 'plpgsql');
SELECT function_returns('my_timestamp', 'trigger');
SELECT has_trigger('traits', 'updated');
SELECT trigger_is('traits', 'updated', 'my_timestamp');

SELECT has_function('nicer_age');
--SELECT functions_are(ARRAY['nicer_age']);
SELECT is(pg_settings.setting, '100') from pg_settings where name = 'max_connections';

SELECT * FROM finish();
ROLLBACK;
