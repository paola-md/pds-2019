
create schema if not exists cleaned;

drop table if exists cleaned.artists cascade;

create table cleaned.artists as (
	select 
		"ConstituentID"::int as artist,
		"DisplayName" as artist_name,
		"Nationality" as nationality,
		case when "Gender" = 'Male' 
		then 
			'M' 
		else 
			'F' 
		end as gender,
		case when "BeginDate"::int = 0 
		then 
			NULL 
		else
			to_date(format('19%s',"BeginDate"), 'YYYY') 
		end as birth,
		case when "EndDate"::int = 0 
		then 
			NULL 
		else
			to_date(format('19%s',"EndDate"), 'YYYY') 
		end as death,
		--daterange(birth, death) as lifespan,
		"Wiki QID" as wiki,
		"ULAN"::int as ulan
	from raw.artists	
);

comment on table cleaned.artists is 'eliminamos la columna artist bio por redundante';

create index cleaned_artists_artist_ix on cleaned.artists (artist);

drop table if exists cleaned.artworks;
create table cleaned.artworks as (
	select 
		"Title" as title,
		string_to_array("ConstituentID",', ')::int[] as artist,
		case when substring("Date" from '\d{4}')::int = NULL
		then 
			NULL
		else
			to_date(format('19%s',
					substring("Date" from '\d{4}')),
			'YYYY')
		end as  creation,
		"Medium" as medium,
		"CreditLine" as creditline,
		"AccessionNumber" accession,
		"Classification" as classification,
		to_date("DateAcquired",'YYYY-MM-DD') as acquisition,
		"Cataloged" as cataloged,
		"ObjectID" as artwork,
		"URL" as url,
		"ThumbnailURL" as thumb_url,
		"Diameter (cm)"::numeric(10,2) as diameter,
		"Depth (cm)"::numeric(10,2) as depth, 
		"Height (cm)"::numeric(10,2) as height,
		"Width (cm)"::numeric(10,2) as width,
		"Duration (sec.)"::numeric(10,2) as duration
	from raw.artworks		
);

comment on table cleaned.artworks is 'eliminamos las columnas que tenemos en artists por integridad al igual que la columna Dimensions porque la información está en otras columnas';

create index cleaned_artworks_artist_ix on cleaned.artworks (artist);
create index cleaned_artworks_artwork_ix on cleaned.artworks (artwork);


