create schema if not exists labels;

drop table if exists labels.classified_department cascade;
create table if not exists labels.classified_department as (

with outcomes as (
  select
    as_of_date,
    artwork,
	classification,
    acquisition as event_date,
    classification = 'photograph' as outcome
    from
        cohorts.new_arrivals
)

select
  as_of_date
  , artwork
  , classification
  , bool_or(outcome)::integer as label
  from outcomes
 group by as_of_date, artwork, classification
);

create index  labels_classified_department_artwork_ix on labels.classified_department(artwork);
create index  labels_classified_department_as_of_date_ix on labels.classified_department(as_of_date);
create index  labels_classified_department_artwork_as_of_date_ix on labels.classified_department(artwork, as_of_date);