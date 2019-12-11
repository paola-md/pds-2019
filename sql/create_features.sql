create schema if not exists features;

drop table if exists features.aggregated;


create table if not exists features.aggregated as 
			  (select * from
				(select as_of_date, classification from labels.classified_department) as aod
					left join lateral (
										select
										count(*) filter (where daterange((aod.as_of_date - interval '2 month'):: date, aod.as_of_date::date) @>acquisition) as "COUNT(2 meses)"
										,count(*) filter (where daterange((aod.as_of_date - interval '4 month'):: date,aod.as_of_date::date) @>acquisition) as "COUNT(4 meses)"
										,count(*) as "totals"
										from semantic.events where aod.classification=classification) 
										as t2 on true
				) t1
			             
create index  labels_classified_department_artwork_ix on labels.classified_department(artwork);
create index  labels_classified_department_as_of_date_ix on labels.classified_department(as_of_date);
create index  labels_classified_department_artwork_as_of_date_ix on labels.classified_department(artwork, as_of_date);

