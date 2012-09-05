# Vaccine Ingredients Database
This is the database used by the [Vaccine Ingredients Calculator](https://github.com/Yenwod/Vaccine-Ingredients-Calculator)

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

## To begin normalizing vaccine component data, run this UPDATE query:
```sql
UPDATE vaccine_components
SET normalized_component_id = normalized_id
FROM
  normalized_vaccine_components
WHERE
	vaccine_components.vaccine_component = normalized_vaccine_components.component_name
```

## Then we can join normalized_vaccine_components on vaccine_components:
```sql
SELECT
  v.vaccine_name,
	vc.vaccine_id,
	vc.normalized_component_id,
	nvc.component_name
FROM
	vaccines v
JOIN vaccine_components vc ON v.vaccine_id = vc.vaccine_id
JOIN normalized_vaccine_components nvc ON vc.normalized_component_id = nvc.normalized_id
ORDER BY
	vc.vaccine_id
```

--And once a reasonable method of populating vaccine_components with more entries is figured out 
--(which will need to find values from other tables, rather than having them hard-coded as they 
--curently are), the vaccine_components.vaccine_component column can be dropped.

This will populate the vaccine_components table using normalized ids for vaccine components rather than
the text itself.  The values for dose and dose measurement need to be adjusted for each component added.
The dose_measurement values are another candidate for normalization, as they are more strings that don't
need to be repeated as they currently are.

```sql
WITH vax_id AS (
SELECT vaccine_id FROM vic.vaccines WHERE vaccine_name='Adacel'
), vax_component AS ( 
SELECT normalized_id FROM vic.normalized_vaccine_components WHERE component_name='pertactin'
)
INSERT INTO vic.vaccine_components(vaccine_id, normalized_component_id, dose, dose_measurement) 
SELECT * FROM vax_id, vax_component,cast(concat(3) as DECIMAL) as dose, concat('mcg') as dose_measurement
```

The vaccine_component column on the vaccine_components table can now be dropped.
