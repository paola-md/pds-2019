create schema if not exists features;

drop table if exists features.aggregated;


create table if not exists features.aggregated as 
			  (select * from
				(select as_of_date, classification from labels.classified_department) as aod
					left join lateral (
										select
										count(*) filter (where daterange((aod.as_of_date - interval '2 month'):: date, aod.as_of_date::date) @>acquisition) as "COUNT(2 meses)"
										,count(*) filter (where daterange((aod.as_of_date - interval '4 month'):: date,aod.as_of_date::date) @>acquisition) as "COUNT(4 meses)"
										,count(*) filter (where daterange((aod.as_of_date - interval '8 month'):: date,aod.as_of_date::date) @>acquisition) as "COUNT(8 meses)"
										,count(*) filter (where daterange((aod.as_of_date - interval '16 month'):: date,aod.as_of_date::date) @>acquisition) as "COUNT(16 meses)"										
										,count(*) as "totals"
										from semantic.events where aod.classification=classification) 
										as t2 on true
				);
			             
create index  labels_features_aggregated_as_of_date_ix on features.aggregated(as_of_date);
create index  labels_features_aggregated_classification_as_of_date_ix on features.aggregated(classification);

