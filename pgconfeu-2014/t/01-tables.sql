-- pg_prove -U postgres -d kittycats 01-tables.sql --verbose
-- psql -U postgres -d kittycats -Xf 01-tables.sql

BEGIN;

SELECT plan(18);

SELECT tables_are('public', ARRAY['cats', 'traits']);
SELECT has_role('catsitter');

SELECT has_table('cats');
SELECT has_pk('cats');
SELECT has_check('cats');

SELECT has_column('cats', 'id');
SELECT col_is_pk('cats', 'id');
SELECT col_not_null('cats', 'id');
SELECT col_type_is('cats', 'id', 'integer');
SELECT col_not_null('cats', 'origin');
SELECT col_type_is('cats', 'origin', 'text');
SELECT col_has_check('cats', 'origin');

SELECT columns_are('cats', ARRAY['id', 'breed', 'origin', 'birthday']);
SELECT has_sequence('public', 'cats_id_seq', 'Column type serial therefore has a sequence');
SELECT col_has_default('cats', 'birthday');
SELECT col_default_is('cats', 'birthday', 'now()');

SELECT has_table('traits');
SELECT has_pk('traits');

SELECT * FROM finish();
ROLLBACK;
