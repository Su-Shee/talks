-- pg_prove -U postgres -d kittycats 04-select.sql --verbose
-- psql -U postgres -d kittycats -Xf 04-select.sql

BEGIN;
SELECT plan(3);

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

SELECT * FROM finish();
ROLLBACK;
