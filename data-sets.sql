insert into vic.manufacturer (company_name) values ('Sanofi Pasteur SA');
insert into vic.manufacturer (company_name) values ('GlaxoSmithKline');
insert into vic.manufacturer (company_name) values ('Merck');


insert into vic.vaccine_type (name) values ('DTaP');
insert into vic.vaccine_type (name) values ('Hib');
insert into vic.vaccine_type (name) values ('MMR');
insert into vic.vaccine_type (name) values ('MMRV');
insert into vic.vaccine_type (name) values ('Varicella');
insert into vic.vaccine_type (name) values ('Hep-B');
insert into vic.vaccine_type (name) values ('Hep-A');
insert into vic.vaccine_type (name) values ('Influenza');
insert into vic.vaccine_type (name) values ('DTaP/Hib');
insert into vic.vaccine_type (name) values ('HPV-4');

insert into vic.disease (disease, vaccine_type_id) values ('Pertussis',1), ('Diphtheria',1), ('Tetanus',1);
insert into vic.disease (disease, vaccine_type_id) values ('Hib',2);
insert into vic.disease (disease, vaccine_type_id) values ('Measles',3), ('Mumps',3), ('Rubella',3);
insert into vic.disease (disease, vaccine_type_id) values ('Measles',4), ('Mumps',4), ('Rubella',4), ('Varicella',4);
insert into vic.disease (disease, vaccine_type_id) values ('Varicella',5);

--insert into vic.disease (disease, vaccine_type_id) values ('Hepatitis B',6);\
--insert into vic.disease (disease, vaccine_type_id) values ('Hepatitis A',7);\

insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Tripedia',1,1,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('Infanrix',2,1,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('ActHIB',1,2,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('TriHIBit',1,2,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('MMR',3,3,'1',0.5);

insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('MMRV',3,4,'1',0.5);
insert into vic.vaccines (vaccine_name, manufacturer_id, vaccine_type_id, combo_vaccine, dose) values ('HPV-4',3,8,'0',0.5);


-- tripedia \
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'formaldehyde',0.100,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'thimerosal',0.03,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'pertussis antigen',0.468,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'diptheria toxoid',6.7,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'aluminum potassium sulfate',0.170,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (1,'tetanus toxoid',5,'Lf');

-- TriHIBit \
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'formaldehyde',0.100,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'thimerosal',0.03,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'pertussis antigen',0.468,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'diptheria toxoid',6.7,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'aluminum potassium sulfate',0.170,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'tetanus toxoid',5,'Lf');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'Hib polysaccharide',0.010,'mg');
insert into vic.vaccine_components (vaccine_id, vaccine_component, dose, dose_measurement) values (4,'tetanus toxoid conjugate',0.024,'mg');

}