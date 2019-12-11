create schema if not exists finals;

drop table if exists finals.classify_photographs cascade;

create table if not exists finals.classify_photographs as (
	select * from labels.classified_department labs
	join clean.artworks cleani 
	on labs.artwork = cleani.artwork
	join features.aggregated feat
	on cleani.classification = feat.classification
);