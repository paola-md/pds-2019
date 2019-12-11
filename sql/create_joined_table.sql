create schema if not exists finals;

drop table if exists finals.classify_photographs cascade;

create table if not exists finals.classify_photographs as (
	select * from labels.classified_department labs
	join features.aggregated feat
	on labs.artwork = feat.artwork
);