-- pg_prove -U postgres -d tapcats 02-columns.sql --verbose
-- psql -U postgres -d tapcats -Xf 02-columns.sql

BEGIN;

SELECT plan(20);
SELECT has_column('cats', 'id');
SELECT col_is_pk('cats', 'id');
SELECT col_not_null('cats', 'id');
SELECT col_type_is('cats', 'id', 'integer');
SELECT col_not_null('cats', 'origin');
SELECT col_type_is('cats', 'origin', 'text');
SELECT col_has_check('cats', 'origin');

SELECT has_sequence('public', 'cats_id_seq', 'Column type serial therefore has a sequence');
SELECT col_has_default('cats', 'birthday');
SELECT col_default_is('cats', 'birthday', 'now()');

SELECT has_table('traits');
SELECT has_pk('traits');

SELECT has_column('traits', 'id');
SELECT col_is_pk('traits', 'id');
SELECT col_not_null('traits', 'id');
SELECT col_type_is('traits', 'id', 'integer');
SELECT has_sequence('public', 'traits_id_seq', 'Column id is type serial and has a sequence');
SELECT has_fk('traits');
SELECT col_is_fk('traits', 'catid');
SELECT fk_ok('traits', 'catid', 'cats', 'id');

SELECT * FROM finish();
ROLLBACK;
