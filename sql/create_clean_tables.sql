\echo 'Moma(cleaned)'
\echo 'Programación para Ciencia de Datos'
\echo 'Ana, Danahi y Paola'
\set VERBOSITY terse
\set ON_ERROR_STOP true


do language plpgsql $$ declare
    exc_message text;
    exc_context text;
    exc_detail text;
begin

do $cleaned$ begin

	create schema if not exists cleaned;

	drop table if exists cleaned.artists cascade;

	create table cleaned.artists as (
		select 
			"ConstituentID"::int as artist,
			"DisplayName" as artist_name,
			"Nationality" as nationality,
			case when "Gender" = 'Male' then 'M' else 'F' end as gender,
			daterange(to_date(format('19%s%s%s',"BeginDate"), 'YYYYMMDD'),format('19%s%s%s',"EndDate"), 'YYYYMMDD') as lifespan,
			"Wiki QID" as wiki,
			"ULAN" as ulan
		from raw.artists	
	);

	comment on table cleaned.artists is 'eliminamos la columna artist bio por redundante';

	create index cleaned_artists_artist_ix on cleaned.artists (artist);
	create index cleaned_artists_lifespan_ix on cleaned.artists (lifespan);

	drop table if exists cleaned.artworks;
	create table cleaned.artworks as (
		select 
			"Title" as title,
			"ConstituentID"::int as artist,
			"Date"::Date as date_creation,
			"Medium" as medium,
			"CreditLine" as creditline,
			"AccessionNumber" accession,
			"Classification" as classification,
			"DateAcquired" as date_acquired,
			"Cataloged" as cataloged,
			"ObjectID" as artwork,
			"URL" as url,
			"ThumbnailURL" as thumb_url,
			"Diameter (cm)"::double as diameter,
			"Depth (cm)"::double as depth, 
			"Height (cm)"::double as height,
			"Width (cm)"::double as width,
			"Duration (sec.)"::double as duration
		from raw.artworks		
	);

	comment on table cleaned.artworks is 'eliminamos las columnas que tenemos en artists por integridad al igual que la columna Dimensions porque la información está en otras columnas';

	create index cleaned_artworks_artist_ix on cleaned.artworks (artist);
	create index cleaned_artworks_artwork_ix on cleaned.artworks (artwork);


	end $cleaned$;
 
 exception when others then
    get stacked diagnostics exc_message = message_text;
    get stacked diagnostics exc_context = pg_exception_context;
    get stacked diagnostics exc_detail = pg_exception_detail;
    raise exception E'\n------\n%\n%\n------\n\nCONTEXT:\n%\n', exc_message, exc_detail, exc_context;
end $$;