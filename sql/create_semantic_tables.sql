drop schema if exists semantic cascade;
create schema semantic;

-- Entidad son las clasificaciones
drop table if exists semantic.entities cascade;
create table semantic.entities as (
	select distinct
		classification
		from 
			cleaned.artworks
);

create index semantic_entities_classification_ix on semantic.entities (classification);

-- Suponemos que un evento es que llegué una obra al museo
drop table if exists semantic.events cascade;
create table semantic.events as (
	select
		title,
		artist,
		creation,
		medium,
		creditline,
		classification,
		acquisition,
		cataloged,
		artwork,
		diameter,
		depth, 
		height,
		width,
		duration
	from 
	cleaned.artworks
);

create index semantic_events_classification_ix on semantic.events (classification);
