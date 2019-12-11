create schema if not exists finals;

drop table if exists finals.classify_photographs cascade;

create table if not exists finals.classify_photographs as (
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
		duration,
		label,
		as_of_date
	from labels.classified_department labs
	join cleaned.artworks cleani 
	on labs.artwork = cleani.artwork
);