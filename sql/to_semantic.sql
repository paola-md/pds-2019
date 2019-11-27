-- Entidad es el pintor
create table semantic.entities as (
	select 
		artist,
		state,
		daterange(,) as from_to
		from 
			cleaned.artists
);

-- Suponemos que un evento es una obra pintada
create table semantic.events as (
	select
);