Much of these contents are deprecated, this is now a scratch file for 

insert into vic.manufacturer (company_name, MVX) values ('Sanofi Pasteur SA', 'PMC');
insert into vic.manufacturer (company_name, MVX) values ('GlaxoSmithKline', 'SKB');
insert into vic.manufacturer (company_name, MVX) values ('Merck', 'MSD');
insert into vic.manufacturer (company_name, MVX) values ('Pfizer', 'PFR');
insert into vic.manufacturer (company_name, MVX) values ('Novartis', 'NOV');
insert into vic.manufacturer (company_name, MVX) values ('MedImmune', 'MED');
insert into vic.manufacturer (company_name, MVX) values ('Wyeth', 'PFR');


insert into vic.vaccine_type (name,CVX) values ('DTaP',20);
insert into vic.vaccine_type (name,CVX) values ('Tdap',115);
insert into vic.vaccine_type (name,CVX) values ('DTaP-Hib',50);
insert into vic.vaccine_type (name,CVX) values ('DTaP-Hep B-IPV',110);
insert into vic.vaccine_type (name,CVX) values ('DTaP-IPV',130);
insert into vic.vaccine_type (name,CVX) values ('DTaP-Hib-IPV',120);
insert into vic.vaccine_type (name,CVX) values ('Hib (PRP-OMP)',48);
insert into vic.vaccine_type (name,CVX) values ('Hib (PRP-T)',49);
insert into vic.vaccine_type (name,CVX) values ('Hib-Hep B',51);
insert into vic.vaccine_type (name,CVX) values ('MMR',03);
insert into vic.vaccine_type (name,CVX) values ('MMRV',94);
insert into vic.vaccine_type (name,CVX) values ('Varicella',21);

insert into vic.vaccine_type (name,CVX) values ('Hep A-adult',52);
insert into vic.vaccine_type (name,CVX) values ('Hep A-ped or adol 2 dose',83);
insert into vic.vaccine_type (name,CVX) values ('Hep A-Hep B',104);

insert into vic.vaccine_type (name,CVX) values ('Hep B-adol or ped',08);
insert into vic.vaccine_type (name,CVX) values ('Hep B-adult',43);
insert into vic.vaccine_type (name,CVX) values ('Hep B-dialysis',44);

insert into vic.vaccine_type (name,CVX) values ('HPV-4',62);
insert into vic.vaccine_type (name,CVX) values ('HPV-2',118);
insert into vic.vaccine_type (name,CVX) values ('IPV',10);
insert into vic.vaccine_type (name,CVX) values ('PCV13',133);
insert into vic.vaccine_type (name,CVX) values ('PCV7',100);
insert into vic.vaccine_type (name,CVX) values ('PCV23',33);




insert into vic.disease (disease, vaccine_type_id) values ('Pertussis, Diphtheria, Tetanus',1);
insert into vic.disease (disease, vaccine_type_id) values ('Tetanus, Diphtheria, Pertussis',2);
insert into vic.disease (disease, vaccine_type_id) values ('Hib PRP-OMP',7);
insert into vic.disease (disease, vaccine_type_id) values ('Hib PRP-T',8);
insert into vic.disease (disease, vaccine_type_id) values ('Measles, Mumps, Rubella',10);
insert into vic.disease (disease, vaccine_type_id) values ('Measles, Mumps, Rubella, Varicella',11);
insert into vic.disease (disease, vaccine_type_id) values ('Varicella',12);
insert into vic.disease (disease, vaccine_type_id) values ('Pneumococcal 13 valent',22);
insert into vic.disease (disease, vaccine_type_id) values ('Pneumococcal 7 valent',23);
insert into vic.disease (disease, vaccine_type_id) values ('Pneumococcal 23 valent',24);
insert into vic.disease (disease, vaccine_type_id) values ('Hep A-adult',13);
insert into vic.disease (disease, vaccine_type_id) values ('Hep A-ped or adol 2 dose',14);
insert into vic.disease (disease, vaccine_type_id) values ('Hep A-Hep B',15);
insert into vic.disease (disease, vaccine_type_id) values ('Hep B-adol or ped',16);
insert into vic.disease (disease, vaccine_type_id) values ('Hep B-adult',17);
insert into vic.disease (disease, vaccine_type_id) values ('Hep B-dialysis',18);
insert into vic.disease (disease, vaccine_type_id) values ('Polio',21);
insert into vic.disease (disease, vaccine_type_id) values ('Human Papaloma Virus 4',19);
insert into vic.disease (disease, vaccine_type_id) values ('Human Papaloma Virus 2',20);
insert into vic.disease (disease, vaccine_type_id) values ('Hib-Hep B',9);





insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Tripedia',1,1,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Infanrix',2,1,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('ActHIB',1,8,'0',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('TriHIBit',1,3,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('MMR',3,10,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('MMRV',3,11,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('HPV-4',3,19,'0',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Daptacel',1,1,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Pediarix',2,6,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Kinrix',2,5,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Pentacel',1,5,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Adacel',1,2,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Boostrix'2,2,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Prevnar',7,21,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Prevnar 13',7,22,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Pneumovax 23',3,24,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Twinrix',2,15,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('IPOL',1,21,'0',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Recombivax HB',3,16,'0',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Recombivax HB',3,17,'0',1.0);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Recombivax HB',3,18,'0',1.0);


-- normalized_vaccine_components
insert into vic.normalized_vaccine_components (component_name) values ('formaldehyde');
insert into vic.normalized_vaccine_components (component_name) values ('thimerosal');
insert into vic.normalized_vaccine_components (component_name) values ('pertussis antigen');
insert into vic.normalized_vaccine_components (component_name) values ('diphtheria toxoid');
insert into vic.normalized_vaccine_components (component_name) values ('tetanus toxoid');
insert into vic.normalized_vaccine_components (component_name) values ('aluminum potassium sulfate');
insert into vic.normalized_vaccine_components (component_name) values ('aluminum hydroxide');
insert into vic.normalized_vaccine_components (component_name) values ('aluminum phosphate');
insert into vic.normalized_vaccine_components (component_name) values ('aluminum hydroxide/phosphate');
insert into vic.normalized_vaccine_components (component_name) values ('polysorbate 80');
insert into vic.normalized_vaccine_components (component_name) values ('gelatin');
insert into vic.normalized_vaccine_components (component_name) values ('Hib polysaccharide');
insert into vic.normalized_vaccine_components (component_name) values ('tetanus toxoid conjugate');
insert into vic.normalized_vaccine_components (component_name) values ('pertactin');
insert into vic.normalized_vaccine_components (component_name) values ('2-phenoxyethanol');
insert into vic.normalized_vaccine_components (component_name) values ('bovine extract');
insert into vic.normalized_vaccine_components (component_name) values ('calf serum');
insert into vic.normalized_vaccine_components (component_name) values ('sodium chloride');
insert into vic.normalized_vaccine_components (component_name) values ('Hep-B surface antigens');
insert into vic.normalized_vaccine_components (component_name) values ('Type 1 Polio Virus/Mahoney');
insert into vic.normalized_vaccine_components (component_name) values ('Type 2 Polio Virus/MEF-1');
insert into vic.normalized_vaccine_components (component_name) values ('Type 3 Polio Virus/Saukett');
insert into vic.normalized_vaccine_components (component_name) values ('Neomycin');
insert into vic.normalized_vaccine_components (component_name) values ('Polymyxin-B');
insert into vic.normalized_vaccine_components (component_name) values ('Streptomycin');
insert into vic.normalized_vaccine_components (component_name) values ('tetanus toxoid covalently bound with Hib');
insert into vic.normalized_vaccine_components (component_name) values ('sucrose');
insert into vic.normalized_vaccine_components (component_name) values ('glutaraldehyde');
insert into vic.normalized_vaccine_components (component_name) values ('MRC-5/human diploid cells');
insert into vic.normalized_vaccine_components (component_name) values ('WI-38/human diploid cells');
insert into vic.normalized_vaccine_components (component_name) values ('PER-C6/human retinal cells');
insert into vic.normalized_vaccine_components (component_name) values ('tetanus toxoid conjugate');
insert into vic.normalized_vaccine_components (component_name) values ('Human albumin');
insert into vic.normalized_vaccine_components (component_name) values ('Bovine serum albumin');
insert into vic.normalized_vaccine_components (component_name) values ('monosodium L-glutamate');
insert into vic.normalized_vaccine_components (component_name) values ('sorbitol');
insert into vic.normalized_vaccine_components (component_name) values ('sodium bicarbonate');
insert into vic.normalized_vaccine_components (component_name) values ('potassium phosphate');
insert into vic.normalized_vaccine_components (component_name) values ('phosphate chloride');
insert into vic.normalized_vaccine_components (component_name) values ('hydrolyzed gelatin');
insert into vic.normalized_vaccine_components (component_name) values ('urea');
insert into vic.normalized_vaccine_components (component_name) values ('yeast protein');
insert into vic.normalized_vaccine_components (component_name) values ('fetal bovine serum');
insert into vic.normalized_vaccine_components (component_name) values ('recombinant human albumin');
insert into vic.normalized_vaccine_components (component_name) values ('live measles virus');
insert into vic.normalized_vaccine_components (component_name) values ('live mumps virus');
insert into vic.normalized_vaccine_components (component_name) values ('live rubella virus');


insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 4');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 9V');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 14');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 18C');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 19F');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 23F');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 6B');
insert into vic.normalized_vaccine_components (component_name) values ('Diphtheria CRM197 protein');
insert into vic.normalized_vaccine_components (component_name) values ('succinate buffer (for pH control)');

insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 1');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 3');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 5');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 6A');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 7F');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 9V');


insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 2');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 8');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 9N');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 9V');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 10A'); 
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 11A')	;
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 12F');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 15B');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 17F');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 18C');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 19F');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 19A');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 20');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 22F');
insert into vic.normalized_vaccine_components (component_name) values ('Streptococcus pneumoniae serotype 33F');


******* 

from this point forward, this file is deprecated and only really being used as a scratch file to copy/paste from as new vaccines are loaded; 
we're now using normalized vaccine components, so straight inserts to this table require hardcoding the normalized vaccine component id, 
or using a query like 

WITH vax_id AS (
SELECT vaccine_id FROM vic.vaccines WHERE vaccine_name='TriHIBit'
), vax_component AS ( 
SELECT normalized_id FROM vic.normalized_vaccine_components WHERE component_name='formaldehyde'
), dose_measurement AS (
SELECT measurement_id FROM vic.measurements WHERE measurement = 'mg'
)
INSERT INTO vic.vaccine_components(vaccine_id, normalized_component_id, dose, dose_measurement) 
SELECT * FROM vax_id, vax_component,cast(concat(0) as DECIMAL) as dose, dose_measurement

*******


-- vaccines 

-- tripedia 
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'formaldehyde',0.100,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'thimerosal',0.3,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'pertussis antigen',46.8,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'diphtheria toxoid',6.7,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'aluminum potassium sulfate',0.170,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'tetanus toxoid',5,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'polysorbate 80',0,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'gelatin',0,'mg');



-- TriHIBit 
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'formaldehyde',0.100,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'thimerosal',0.3,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'pertussis antigen',46.8,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'diphtheria toxoid',6.7,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'aluminum potassium sulfate',0.170,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'tetanus toxoid',5,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'Hib polysaccharide',10,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'tetanus toxoid conjugate',24,'mcg');


--ActHIB
10 mcg Hib polysaccharide
24 mcg tetanus toxoid
0.5 microgram formaldehyde





-- Infanrix 

insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'pertussis antigen',25,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'pertactin',8,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'diphtheria toxoid',25,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'tetanus toxoid',10,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'aluminum hydroxide',0.625,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'formaldehyde',100,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'polysorbate 80',100,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'bovine extract',0,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'sodium chloride',4.5,'mg');

-- Daptacel 

insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'pertussis antigen',10,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'pertactin',3,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'diphtheria toxoid',15,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'tetanus toxoid',5,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'formaldehyde',5,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'2-phenoxyethanol',3.3,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'aluminum phosphate',1.5,'mg');


-- Pediarix 

insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'pertussis antigen',25,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'pertactin',8,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'diphtheria toxoid',25,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'tetanus toxoid',10,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'formaldehyde',100,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'aluminum hydroxide/phosphate',0.85,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'sodium chloride',4.5,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'polysorbate 80',100,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'bovine extract',0,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'Hep-B surface antigens',10,'mcg'); *** 
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'Type 1 Polio Virus/Mahoney',40,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'Type 2 Polio Virus/MEF-1',8,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'Type 3 Polio Virus/Saukett',32,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'Neomycin',0.05,'ng');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'Polymyxin-B',0.01,'ng');


-- Kinrix 

insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'pertussis antigen',25,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'pertactin',8,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'diphtheria toxoid',25,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'tetanus toxoid',10,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'formaldehyde',100,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'aluminum hydroxide',0.6,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'sodium chloride',4.5,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'polysorbate 80',100,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'bovine extract',0,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'Type 1 Polio Virus/Mahoney',40,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'Type 2 Polio Virus/MEF-1',8,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'Type 3 Polio Virus/Saukett',32,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'Neomycin',0.05,'ng');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'Polymyxin-B',0.01,'ng');


-- Pentacel

insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'pertussis antigen',20,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'pertactin',8,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'diphtheria toxoid',15,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'tetanus toxoid',5,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'Hib polysaccharide',10,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'tetanus toxoid covalently bound with Hib',24,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'formaldehyde',5,'mcg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'aluminum phosphate',1.5,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'sucrose',42.5,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'polysorbate 80',10,'ppm');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'2-phenoxyethanol',3.3,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'bovine extract',50,'ng');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'glutaraldehyde',50,'ng');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'MRC-5/human diploid cells',0.0,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'Type 1 Polio Virus/Mahoney',40,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'Type 2 Polio Virus/MEF-1',8,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'Type 3 Polio Virus/Saukett',32,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'Neomycin',4,'pg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (12,'Polymyxin-B',4,'pg');


-- Prevnar 

Streptococcus pneumoniae serotype 4, 2 mcg
Streptococcus pneumoniae serotype 9V, 2 mcg
Streptococcus pneumoniae serotype 14,
Streptococcus pneumoniae serotype 18C,2 mcg
Streptococcus pneumoniae serotype 19F,2 mcg
Streptococcus pneumoniae serotype 23F,2 mcg
Streptococcus pneumoniae serotype 6B,4 mcg
Diphtheria CRM197 protein, 20 mcg
aluminum phosphate, 0.125 mg

-- Prevnar 13 

Streptococcus pneumoniae serotype 1, 2.2 mcg
Streptococcus pneumoniae serotype 3, 2.2 mcg
Streptococcus pneumoniae serotype 4, 2.2 mcg
Streptococcus pneumoniae serotype 5, 2.2 mcg
Streptococcus pneumoniae serotype 6A, 2.2 mcg
Streptococcus pneumoniae serotype 6B, 4.4 mcg
Streptococcus pneumoniae serotype 7F, 2.2 mcg
Streptococcus pneumoniae serotype 9V, 2.2 mcg
Streptococcus pneumoniae serotype 14, 2.2 mcg
Streptococcus pneumoniae serotype 18C, 2.2 mcg
Streptococcus pneumoniae serotype 19A, 2.2 mcg
Streptococcus pneumoniae serotype 19F, 2.2 mcg
Streptococcus pneumoniae serotype 23F, 2.2 mcg
Diphtheria CRM197 protein, 34 mcg
aluminum phosphate, 0.125 mg
Polylsorbate-80, 100 mcg
succinate buffer (for pH control), 295 mcg

-- Pneumovax 23

Streptococcus pneumoniae serotype 1 25 mcg,
Streptococcus pneumoniae serotype 2 25 mcg,
Streptococcus pneumoniae serotype 3 25 mcg,
Streptococcus pneumoniae serotype 4 25 mcg,
Streptococcus pneumoniae serotype 5 25 mcg,
Streptococcus pneumoniae serotype 6B 25 mcg,
Streptococcus pneumoniae serotype 7F 25 mcg,
Streptococcus pneumoniae serotype 8 25 mcg,
Streptococcus pneumoniae serotype 9N 25 mcg,
Streptococcus pneumoniae serotype 9V 25 mcg,
Streptococcus pneumoniae serotype 10A 25 mcg,
Streptococcus pneumoniae serotype 11A 25 mcg,
Streptococcus pneumoniae serotype 12F 25 mcg,
Streptococcus pneumoniae serotype 14 25 mcg,
Streptococcus pneumoniae serotype 15B 25 mcg,
Streptococcus pneumoniae serotype 17F 25 mcg,
Streptococcus pneumoniae serotype 18C 25 mcg,
Streptococcus pneumoniae serotype 19F 25 mcg,
Streptococcus pneumoniae serotype 19A 25 mcg,
Streptococcus pneumoniae serotype 20 25 mcg,
Streptococcus pneumoniae serotype 22F 25 mcg,
Streptococcus pneumoniae serotype 23F 25 mcg,
Streptococcus pneumoniae serotype 33F 25 mcg


-- IPOL (IPV)

Type 1 Polio Virus/Mahoney, 40 DU
Type 2 Polio Virus/MEF-1, 8 DU
Type 3 Polio Virus/Saukett, 32 DU
calf serum 
2-phenoxyethanol 
formaldehyde
neomycin, 5 ng
streptomycin, 200ng
Polymyxin-B, 25 ng



-- ProQuad 

20mg sucrose
11 mg hydrolyzed gelatin
2.5mg urea
2.3 mg sodium chloride
0.25mg human albumin
16 mg sorbitol
0.38 mg monosodium L-glutamate
0.13 mg sodium bicarbonate
94 mcg potassium phosphate
58 mcg potassium chloride
MRC-5 cells 
WI-38 cells 
5mcg neomycin
0.5mcg bovine serum albumin


3.00 log10 TCID50 of measles virus
4.30 log10 TCID50 of mumps virus
3.00 log10 TCID50 of rubella virus
3.99 log10 PFU of Oka/Merck varicella virus

-- M-M-R II

hydrolyzed gelatin 14.5 mg
sorbitol 14.5 mg
sucrose 1.9 mg
recombinant human albumin 0.3 mg
fetal bovine serum 1 ppm
25 mcg Neomycin

1,000 TCID50 measles virus
12,500 TCID50 mumps virus
1,000 TCID50 rubella virus



-- Recombivax HB adol/ped

aluminum hydroxide, 0.5mg
Hep-B surface antigens, 5 mcg
formaldehyde. 7.5 mcg
yeast protein

-- Recombivax HB adult

aluminum hydroxide, 0.5mg
Hep-B surface antigens, 10 mcg
formaldehyde. 15 mcg
yeast protein

***

ENGERIX-B adol/ped  0.5mL
Hep-B surface antigens, 10 mcg
aluminum hydroxide 0.25 mg
disodium phosphate dihydrate 0.49 mg
sodium dihydrogen phosphate dihydrate, 0.355 mg
sodium chloride 4.5mg
yeast protein

ENGERIX-B adult 1mL
Hep-B surface antigens, 20 mcg
aluminum hydroxide 0.5 mg
disodium phosphate dihydrate 0.98 mg
sodium dihydrogen phosphate dihydrate, 0.71 mg
sodium chloride 9mg
yeast protein


