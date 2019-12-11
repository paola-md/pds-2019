create schema if not exists features;

drop table if exists features.summary cascade;

create table if not exists features.summary as 
			  (select 
					classification,
					count(distinct artwork) artwork
					, min(height) min_heigth
			        , avg(height) mean_heigth
				    , max(height) max_heigth
					, min(diameter) min_diameter
					, avg(diameter) mean_diameter
					, max(diameter) max_diameter
					, min(width) min_widht
					, avg(width) mean_width
					, max(width) max_width
					, min(duration) min_duration
					, avg(duration) avg_duration
					, max(duration) max_duration
				    , count(*) obras
				  from semantic.events
               group by classification );
			             
create index features_summary_artwork_ix on features.summary(artwork);

