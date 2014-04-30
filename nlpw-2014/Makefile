# pgtap talk schema, data & tests

table: cats-schema.sql
	psql -U postgres -d tapcats < $<

data: cats-data.sql
	psql -U postgres -d tapcats < $<

clean:
	psql -U postgres -d tapcats -c 'drop role catsitter;'
	psql -U postgres -d tapcats -c 'drop trigger updated on traits;'
	psql -U postgres -d tapcats -c 'drop trigger created on traits;'
	psql -U postgres -d tapcats -c 'drop function my_timestamp();'
	psql -U postgres -d tapcats -c 'drop table traits;'
	psql -U postgres -d tapcats -c 'drop table cats;'

test: t/*.sql
	pg_prove -U postgres -d tapcats $^ --verbose
