create schema if not exists finals;

drop table if exists finals.artworks cascade;

create table if not exists finals.artworks as (
	select * from labels.classified_department labs
	join features.aggregated feat
	on labs.artwork = feat.artwork
);