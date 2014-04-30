-- pg_prove -U postgres -d tapcats 01-tests.sql --verbose
-- psql -U postgres -d tapcats -Xf 01-tests.sql

BEGIN;

SELECT plan(32);

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

SELECT has_function('my_timestamp');
SELECT function_lang_is('my_timestamp', 'plpgsql');
SELECT function_returns('my_timestamp', 'trigger');
SELECT trigger_is('traits', 'updated', 'my_timestamp');

SELECT lives_ok(
  'INSERT INTO
    cats (name, breed, origin)
  VALUES
    ($$Hissy$$, $$Siamese$$, $$TH$$);',
  'inserting a new cat should be ok'
);

SELECT throws_ok(
  'INSERT INTO
    cats (name, breed, origin)
  VALUES
    ($$MaoMao$$, $$Ordinary Housecat$$, $$Germany$$);',
  'new row for relation "cats" violates check constraint "cats_origin_check"',
  'inserting origin as country name should violate a check constraint'
);

PREPARE basic_select AS
  SELECT name, breed, origin
  FROM cats
  WHERE breed = 'Burmese';

SELECT results_eq (
  'basic_select',
  $$VALUES('Kitty'::text, 'Burmese'::text, 'TH'::text)$$,
  'should select all cats of Burmese breed'
);

-- index_is_type
-- is_superuser, is_member_of, *_owner_is (view, tablespace, schema...), database_privs_are

SELECT * FROM finish();
ROLLBACK;
