create schema if not exists labels;

drop table if exists labels.classified_department;
create table if not exists labels.classified_department as (

with outcomes as (
  select
    as_of_date,
    artwork,
    acquisition as event_date,
    classification as outcome
    from
        cohorts.new_arrivals
)

select
  as_of_date
  , artwork
  , outcome as label
  from outcomes
 where
daterange(as_of_date::date,(as_of_date + interval '5 year')::date) @>  event_date
 group by as_of_date, artwork, outcomes
);

create index  labels_classified_department_artwork_ix on labels.classified_department(artwork);
create index  labels_classified_department_as_of_date_ix on labels.classified_department(as_of_date);
create index  labels_classified_department_artwork_as_of_date_ix on labels.classified_department(artwork, as_of_date);