insert into vic.manufacturer (company_name, MVX) values ('Sanofi Pasteur SA', 'PMC');
insert into vic.manufacturer (company_name, MVX) values ('GlaxoSmithKline', 'SKB');
insert into vic.manufacturer (company_name, MVX) values ('Merck', 'MSD');
insert into vic.manufacturer (company_name, MVX) values ('Pfizer', 'PFR');
insert into vic.manufacturer (company_name, MVX) values ('Novartis', 'NOV');
insert into vic.manufacturer (company_name, MVX) values ('MedImmune', 'MED');


insert into vic.vaccine_type (name,CVX) values ('DTaP',20);
insert into vic.vaccine_type (name,CVX) values ('DTaP-Hib',50);
insert into vic.vaccine_type (name,CVX) values ('DTaP-Hep B-IPV',110);
insert into vic.vaccine_type (name,CVX) values ('DTaP-IPV',130);
insert into vic.vaccine_type (name,CVX) values ('DTaP-Hib-IPV',120);
insert into vic.vaccine_type (name,CVX) values ('Hib',48);
insert into vic.vaccine_type (name,CVX) values ('Hib',49);
insert into vic.vaccine_type (name,CVX) values ('Hib-Hep B',51);
insert into vic.vaccine_type (name,CVX) values ('MMR',03);
insert into vic.vaccine_type (name,CVX) values ('MMRV',94);
insert into vic.vaccine_type (name,CVX) values ('Varicella',21);
insert into vic.vaccine_type (name,CVX) values ('Hep B',08);
insert into vic.vaccine_type (name,CVX) values ('Hep B',42);
insert into vic.vaccine_type (name,CVX) values ('Hep B',43);
insert into vic.vaccine_type (name,CVX) values ('HPV-4',62);
insert into vic.vaccine_type (name,CVX) values ('HPV-2',118);
insert into vic.vaccine_type (name,CVX) values ('IPV',10);
insert into vic.vaccine_type (name,CVX) values ('PCV13',133);
insert into vic.vaccine_type (name,CVX) values ('PCV7',100);
insert into vic.vaccine_type (name,CVX) values ('PCV23',33);

-- insert into vic.vaccine_type (name,CVX) values ('Hep A');
-- insert into vic.vaccine_type (name,CVX) values ('Influenza');


insert into vic.disease (disease, vaccine_type_id) values ('Pertussis',1), ('Diphtheria',1), ('Tetanus',1);
insert into vic.disease (disease, vaccine_type_id) values ('Pertussis',1), ('Diphtheria',1), ('Tetanus',1), ('Hib',6);
insert into vic.disease (disease, vaccine_type_id) values ('Hib',6);
insert into vic.disease (disease, vaccine_type_id) values ('Measles',9), ('Mumps',9), ('Rubella',9);
insert into vic.disease (disease, vaccine_type_id) values ('Measles',9), ('Mumps',9), ('Rubella',9), ('Varicella',11);
insert into vic.disease (disease, vaccine_type_id) values ('Varicella',11);
insert into vic.disease (disease, vaccine_type_id) values ('Pneumococcal',18);
insert into vic.disease (disease, vaccine_type_id) values ('Pneumococcal',19);
insert into vic.disease (disease, vaccine_type_id) values ('Pneumococcal',20);
insert into vic.disease (disease, vaccine_type_id) values ('Hepatitis B',12);
insert into vic.disease (disease, vaccine_type_id) values ('Hepatitis B',13);
insert into vic.disease (disease, vaccine_type_id) values ('Hepatitis B',14);
insert into vic.disease (disease, vaccine_type_id) values ('Polio',17);
insert into vic.disease (disease, vaccine_type_id) values ('Human Papaloma Virus 4',15);
insert into vic.disease (disease, vaccine_type_id) values ('Human Papaloma Virus 2',16);
insert into vic.disease (disease, vaccine_type_id) values ('Hib-Hep B',8);



--insert into vic.disease (disease, vaccine_type_id) values ('Hepatitis B',6);
--insert into vic.disease (disease, vaccine_type_id) values ('Hepatitis A',7);

insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Tripedia',1,1,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Infanrix',2,1,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('ActHIB',1,2,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('TriHIBit',1,2,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('MMR',3,9,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('MMRV',3,10,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('HPV-4',3,15,'0',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Daptecel',1,1,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Pediarix',2,3,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Kinrix',2,4,'1',0.5);


-- tripedia 
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'formaldehyde',0.100,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'thimerosal',0.03,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'pertussis antigen',0.0468,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'diptheria toxoid',6.7,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'aluminum potassium sulfate',0.170,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'tetanus toxoid',5,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'polysorbate 80',0,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'gelatin',0,'mg');


-- TriHIBit 
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'formaldehyde',0.100,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'thimerosal',0.03,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'pertussis antigen',0.0468,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'diptheria toxoid',6.7,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'aluminum potassium sulfate',0.170,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'tetanus toxoid',5,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'Hib polysaccharide',0.010,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'tetanus toxoid conjugate',0.024,'mg');

-- Infanrix 

insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'pertussis antigen',0.025,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'pertactin',0.008,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'diptheria toxoid',25,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'tetanus toxoid',10,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'aluminum hydroxide',0.625,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'formaldehyde',0.100,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'polysorbate 80',0.100,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'bovine extract',0,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (2,'sodium chloride',4.5,'mg');

-- Daptacel 

insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'pertussis antigen',0.010,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'pertactin',0.003,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'diptheria toxoid',15,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'tetanus toxoid',5,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'formaldehyde',0.005,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'2-phenoxyethanol',3.3,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (8,'aluminum phosphate',1.5,'mg');


-- Pediarix 

insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'pertussis antigen',0.025,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'pertactin',0.008,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'diptheria toxoid',25,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'tetanus toxoid',10,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'formaldehyde',0.100,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'aluminum hydroxide/phosphate',0.085,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'sodium chloride',4.5,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'polysorbate 80',0.100,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'bovine extract',0,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'Hep-B surface antigens',0.010,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'Type 1 Polio Virus/Mahoney',40,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'Type 2 Polio Virus/MEF-1',8,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'Type 3 Polio Virus/Saukett',32,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'Neomycin',0.05,'ng');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (9,'Polymyxin-B',0.01,'ng');


-- Kinrix 

insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'pertussis antigen',0.025,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'pertactin',0.008,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'diptheria toxoid',25,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'tetanus toxoid',10,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'formaldehyde',0.100,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'aluminum hydroxide/phosphate',0.085,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'sodium chloride',4.5,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'polysorbate 80',0.100,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'bovine extract',0,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'Type 1 Polio Virus/Mahoney',40,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'Type 2 Polio Virus/MEF-1',8,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'Type 3 Polio Virus/Saukett',32,'DU');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'Neomycin',0.05,'ng');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (11,'Polymyxin-B',0.01,'ng');




