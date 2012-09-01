VIC-v2
======

Vaccine Ingredients Calculator

## Resources

URLs to useful resources (such as HL7 vaccine codes) are organized at http://delicious.com/cdowney/VIC

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

## Query Examples

```sql
select m.mvx, m.company_name, vt.cvx, vt.name, v.vaccine_name 
from vaccine_type vt 
inner join vaccines v on v.vaccine_type_id = vt.vaccine_type_id 
inner join manufacturer m on v.manufacturer_id = m.manufacturer_id
order by cvx, mvx
```