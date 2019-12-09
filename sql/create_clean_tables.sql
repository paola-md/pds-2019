
create schema if not exists cleaned;

drop table if exists cleaned.artists cascade;

create table cleaned.artists as (
	select 
		"ConstituentID"::int as artist,
		"DisplayName" as artist_name,
		"Nationality" as nationality,
		case when "Gender" = 'Male' 
		then 
			0 
		else 
			1 
		end as female,
		case when "BeginDate"::int = 0 
		then 
			NULL 
		else
			to_date("BeginDate", 'YYYY') 
		end as birth,
		case when "EndDate"::int = 0 
		then 
			NULL 
		else
			to_date("EndDate", 'YYYY') 
		end as death,
		daterange(
			case when "BeginDate"::int = 0 then NULL 
			else to_date("BeginDate", 'YYYY')
			,
			case when "EndDate"::int = 0 then NULL 
			else to_date("EndDate", 'YYYY') 
			) 
		as lifespan,
		lower("Wiki QID") as wiki,
		"ULAN"::int as ulan
	from raw.artists	
);

comment on table cleaned.artists is 'eliminamos la columna artist bio por redundante';

create index cleaned_artists_artist_ix on cleaned.artists (artist);

drop table if exists cleaned.artworks;
create table cleaned.artworks as (
	select 
		lower("Title") as title,
		string_to_array("ConstituentID",', ')::int[] as artist,
		case when substring("Date" from '\d{4}')::int = NULL
		then 
			NULL
		else
			to_date(substring("Date" from '\d{4}'),	'YYYY')
		end as  creation,
		lower("Medium") as medium,
		lower("CreditLine") as creditline,
		"AccessionNumber" as accession,
		lower("Classification") as classification,
		to_date("DateAcquired",'YYYY-MM-DD') as acquisition,
		case when "Cataloged" = 'Y' 
		then 
			1 
		else 
			0 
		end as cataloged,
		lower("Department") as department,
		"ObjectID"::int as artwork,
		"URL" as url,
		"ThumbnailURL" as thumb_url,
		"Diameter (cm)"::numeric(10,2) as diameter,
		"Depth (cm)"::numeric(10,2) as depth, 
		"Height (cm)"::numeric(10,2) as height,
		"Width (cm)"::numeric(10,2) as width,
		"Duration (sec.)"::int as duration
	from raw.artworks		
);

comment on table cleaned.artworks is 'eliminamos las columnas que tenemos en artists por integridad al igual que la columna Dimensions porque la información está en otras columnas';

create index cleaned_artworks_artist_ix on cleaned.artworks (artist);
create index cleaned_artworks_artwork_ix on cleaned.artworks (artwork);


