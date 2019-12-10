drop schema if exists cohorts cascade; 
create schema if not exists cohorts;

drop table if exists cohorts.new_arrivals;

create table if not exists 
 as (
with as_of_dates as (
  select
    generate_series(min(acquisition), max(acquisition), '10 years') as as_of_date
    from
        semantic.events
),

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
		(aod.as_of_date - interval '20 year')::date,
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
)
