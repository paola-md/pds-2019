create schema if not exists semantic;

-- Entidad son las clasificaciones
drop table if exists semantic.entities cascade;
create table semantic.entities as (
	select distinct
		classification,
		department
		from 
			cleaned.artworks
);

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
		department,
		artwork,
		diameter,
		depth, 
		height,
		width,
		duration
	from 
	cleaned.artworks
);