create schema if not exists features;

drop table if exists features.aggregated;


create table if not exists features.aggregated as 
			  (select 
					classification,
					count(distinct artworks) artworks
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
               group by classification ) t1
			             
create index features_aggregated_artwork_ix on features.aggregated(artwork);

