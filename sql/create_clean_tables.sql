drop schema if exists cleaned cascade;
create schema cleaned;

drop table if exists cleaned.artists cascade;

-- Crear nueva tabla de "artists" en el esquema  
create table cleaned.artists as (
	select 
-- Variable ConstituentID convertirla en entera y nombrarla artist.
		"ConstituentID"::int as artist,
-- Variable DisplayName nombrarla artist_name
		lower("DisplayName") as artist_name,
-- Variable Nationality en minúsculas
		lower("Nationality") as nationality,
-- Variable Gender nombrarla female, 1 si es mujer y 0 si es hombre
		case when "Gender" = 'Male' 
		then 
			0 
		else 
			1 
		end as female,
-- Variable BeginDate nombrarla birth y hacerla fecha
		case when "BeginDate"::int = 0 
		then 
			NULL 
		else
			to_date("BeginDate", 'YYYY') 
		end as birth,
-- Variable EndDate nombra death y hacerla fecha
		case when "EndDate"::int = 0 
		then 
			NULL 
		else
			to_date("EndDate", 'YYYY') 
		end as death,
-- Variable Wiki QID nombrarla wiki
		lower("Wiki QID") as wiki,
-- Variable ULAN nombrarla en  minúsuculas
		"ULAN"::int as ulan
	from raw.artists	
);

comment on table cleaned.artists is 'eliminamos la columna artist bio por redundante';
-- Crear índices
create index cleaned_artists_artist_ix on cleaned.artists (artist);

-- Eliminar tabla en caso de que exista
drop table if exists cleaned.artworks;

-- Crear nueva tabla artworks en el esquema
create table cleaned.artworks as (
	select 
-- Variable Title nombrarla en minúsculas
		lower("Title") as title,
-- Variable ConstituentID hacerla array y nombrarla artist
		string_to_array("ConstituentID",', ')::int[] as artist,
-- Variable Date hacerla fecha y nombrarla creation
		case when substring("Date" from '\d{4}')::int = NULL
		then 
			NULL
		else
			to_date(substring("Date" from '\d{4}'),	'YYYY')
		end as  creation,
-- Variable Medium nombrarla en minúsculas	
	        lower("Medium") as medium,
-- Variable CreditLine nombrarla en minúsculas
		lower("CreditLine") as creditline,
-- Variable AccessionNumber nombrarla accesion
		"AccessionNumber" as accession,
-- Variable Classification nombrarla en minúsculas
		lower("Classification") as classification,
-- Variable DateAcquiered hacerla fecha y nombrarla acquisition		
		to_date("DateAcquired",'YYYY-MM-DD') as acquisition,
-- Variable Catalogued nombrarla en minúsculas. 1 si esta catalogada, 2 si no
		case when "Cataloged" = 'Y' 
		then 
			1 
		else 
			0 
		end as cataloged,
-- Variable Department  nombrarla en minúsculas
		lower("Department") as department,
-- Variable ObjectID nombrarla artwork
		"ObjectID"::int as artwork,
-- Variable URL nombrarla en minúsculas
		"URL" as url,
-- Variable ThumbnailURL nombrarla thumb_url
		"ThumbnailURL" as thumb_url,
-- Variable Diameter nombrarla en minúsculas
		"Diameter (cm)"::numeric(10,2) as diameter,
-- Variable Depth nombrarla en minúsculas
		"Depth (cm)"::numeric(10,2) as depth,
-- Variable Height nombrarla en minúsculas 
		"Height (cm)"::numeric(10,2) as height,
-- Variable Width nombrarla en minúsculas
		"Width (cm)"::numeric(10,2) as width,
-- Variable Duration nombrarla en minúsculas
		"Duration (sec.)"::numeric(10,2) as duration
	from raw.artworks		
);

comment on table cleaned.artworks is 'eliminamos las columnas que tenemos en artists por integridad al igual que la columna Dimensions porque la información está en otras columnas';

-- Crear índices
create index cleaned_artworks_artist_ix on cleaned.artworks (artist);
create index cleaned_artworks_artwork_ix on cleaned.artworks (artwork);


