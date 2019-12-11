drop schema if exists cohorts cascade; 
create schema if not exists cohorts;

drop table if exists cohorts.new_arrivals;
-- Crear tabla cohorts.new_arrivals en el esquema cohorts
create table if not exists cohorts.new_arrivals as (
with as_of_dates as (
-- Generar as_of_date cada 2 meses
  select
    generate_series(min(acquisition), max(acquisition), '2 month') as as_of_date
    from
        semantic.events
),
-- Para cada periodo en as_of_date, seleccionar las características de la obra de arte que ingreso
new_artwork as(
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
		
		aod.as_of_date::date,
		daterange(
		(aod.as_of_date - interval '2 month')::date,
		aod.as_of_date::date)
		@> acquisition as "new?"
	from (
		select
		as_of_date
		from as_of_dates
		) as aod
		left join lateral(
			select *, age(acquisition, as_of_date)
			from semantic.events
		) as t2 on true
)

select * from
new_artwork
where "new?" is true 
and daterange('01-01-2018'::date,'01-01-2020'::date) @>  acquisition
);
