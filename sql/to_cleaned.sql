-- name: artists
create table cleaned.artists as (
	select 
		ConstituentID::int as artist,
		DisplayName as artist_name,
		BeginData as begin_date, /*Si es 0 poner Null*/
		EndDate as end_date,  /*Si es 0 poner Null*/
		case when Gender == "Male" then 'M' else 'F' end as gender, 
)


create index cleaned_artists_artist_ix on cleaned.artists (artist)
create index cleaned_artists_interval_ix on cleaned.artists (interval)

create table cleaned.artworks as (
	select 
		ConstituentID::int as artist,
		Artist as artist_name
)