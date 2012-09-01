VIC-v2
======

Vaccine Ingredients Calculator

## Rapid database creation

### Setup for database creation
Currently, before successfully running the dump script through psql, will need to use createuser and accept all defaults.
This only needs to be done once.
```bash
createuser mschrimshaw
```

Creating a tablespace only needs to be done once.
```sql
--http://www.postgresql.org/docs/9.1/static/manage-ag-tablespaces.html
create tablespace vic_tablespace location '/Users/chris/rails_projects/data';
```

### Database creaton
```bash
dropdb VIC
psql -f vic_db_dump.sql
```
```SQL
--http://www.postgresql.org/docs/9.1/static/ddl-schemas.html
--SHOW search_path;
SET search_path TO vic,public;
```

NA: Create a script to run these commands