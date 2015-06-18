-- pg_prove -U postgres -d kittycats 01-tables.sql --verbose
-- psql -U postgres -d kittycats -Xf 01-tables.sql

BEGIN;

SELECT plan(38);

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

SELECT columns_are('cats', ARRAY['id', 'picture', 'breed', 'origin', 'birthday']);
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
SELECT col_is_fk('traits', 'kitty');
SELECT fk_ok('traits', 'kitty', 'cats', 'id');

SELECT has_function('my_timestamp');
SELECT function_lang_is('my_timestamp', 'plpgsql');
SELECT function_returns('my_timestamp', 'trigger');
SELECT trigger_is('traits', 'updated', 'my_timestamp');

SELECT has_function('nicer_age');
SELECT matches(nicer_age(cats.birthday), 'months') FROM cats WHERE name = 'Kitty';
SELECT isa_ok(nicer_age('2014-10-09'), 'text', 'Function nicer_age returns text.');
SELECT function_returns('nicer_age', 'text');

SELECT is(pg_settings.setting, '100') from pg_settings where name = 'max_connections';

SELECT lives_ok(
  'INSERT INTO
    cats (name, breed, origin, picture)
  VALUES
    ($$Hissy$$, $$Siamese$$, $$TH$$, $$fritz.jpg$$);',
  'inserting a new cat should be ok'
);

SELECT throws_ok(
  'INSERT INTO
    cats (name, breed, origin, picture)
  VALUES
    ($$MaoMao$$, $$Ordinary Housecat$$, $$Germany$$, $$fritz.jpg$$);',
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

SELECT * FROM finish();
ROLLBACK;
