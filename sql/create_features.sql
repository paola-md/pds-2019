create schema if not exists features;

drop table if exists features.aggregated;


create table if not exists features.aggregated as (
select * from
(
  select
    as_of_date,
    artwork
    from
        labels.classified_department
) as aod
             left join lateral ( 
               select
                  count(distinct artwork) filter(where daterange((aod.as_of_date - interval '5 year')::date, aod.as_of_date::date) @> acquisition) as "artwork_5y",
                  avg(height) mean_heigth
				  , min(height) min_heigth
				  , count(*) obras
				  from semantic.events
                where aod.artwork = artwork
             ) as t2
                 on true
);
create index features_aggregated_as_of_date_ix on features.aggregated(as_of_date);
create index features_aggregated_artwork_ix on features.aggregated(artwork);
create index features_aggregated_artwork_as_of_date_ix on features.aggregated(artwork, as_of_date);