drop schema if exists semantic cascade;
create schema semantic;

-- Entidad son las clasificaciones
drop table if exists semantic.entities cascade;
create table semantic.entities as (
-- Seleccionar classification de la tabla cleaned.artworks
	select distinct
		classification
		from 
			cleaned.artworks
);

Crear índice
create index semantic_entities_classification_ix on semantic.entities (classification);

-- Suponemos que un evento es que llegué una obra al museo
drop table if exists semantic.events cascade;

-- Crear tabla sematic.events en el esquema de semantic
create table semantic.events as (
-- Seleccionar de la tabla cleaned.artworks
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

-- Crear índice
create index semantic_events_classification_ix on semantic.events (classification);
