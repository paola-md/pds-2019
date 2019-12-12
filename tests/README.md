# Pruebas de SQL

Una vez que se ha ejecutado RUNME.sh, al conectarse a la base de datos de la siguiente manera
```
psql -U moma -d moma -h 0.0.0.0 -W
```

Se podrán verificar los siguientes pasos del flujo de trabajo
1. create squemas
2. create raw tables
3. to cleaned
4. to semantic
5. cohort new arrivals
6. labels
7. features

Verificamos si los esquemas fueron creados
```
\dn
```
La salida debería ser la siguiente:
```
   List of schemas
   Name   │  Owner   
══════════╪══════════
 cleaned  │ moma
 cohorts  │ moma
 features │ moma
 labels   │ moma
 public   │ postgres
 raw      │ moma
 semantic │ moma
(7 rows)

```
* raw: copia de la base de datos de MoMA
* cleaned: limpieza de la base de datos
* semantic: tranformación de datos a entidades (classification) y eventos (Nueva llegada de obra de arte al museo)
* cohort: define as_of_dates para un cierto periodo
* labels: crea etiquetas para las observaciones de los periodos
* features: creación de nuevas features

Observamos que las tablas raw fueran creadas después de crear el esquema
```
\dt raw.
```

```
         List of relations
 Schema │   Name   │ Type  │ Owner 
════════╪══════════╪═══════╪═══════
 raw    │ artists  │ table │ moma
 raw    │ artworks │ table │ moma
(2 rows)
```
Observamos los datos después de ejecutar el esquema de limpieza
```
 \d cleaned.artists
```

```
                Table "cleaned.artists"
   Column    │  Type   │ Collation │ Nullable │ Default 
═════════════╪═════════╪═══════════╪══════════╪═════════
 artist      │ integer │           │          │ 
 artist_name │ text    │           │          │ 
 nationality │ text    │           │          │ 
 female      │ integer │           │          │ 
 birth       │ date    │           │          │ 
 death       │ date    │           │          │ 
 wiki        │ text    │           │          │ 
 ulan        │ integer │           │          │ 
Indexes:
    "cleaned_artists_artist_ix" btree (artist)
```

    
```    
\d cleaned.artworks
```

```
                    Table "cleaned.artworks"
     Column     │     Type      │ Collation │ Nullable │ Default 
════════════════╪═══════════════╪═══════════╪══════════╪═════════
 title          │ text          │           │          │ 
 artist         │ integer[]     │           │          │ 
 creation       │ date          │           │          │ 
 medium         │ text          │           │          │ 
 creditline     │ text          │           │          │ 
 accession      │ text          │           │          │ 
 classification │ text          │           │          │ 
 acquisition    │ date          │           │          │ 
 cataloged      │ integer       │           │          │ 
 department     │ text          │           │          │ 
 artwork        │ integer       │           │          │ 
 url            │ text          │           │          │ 
 thumb_url      │ text          │           │          │ 
 diameter       │ numeric(10,2) │           │          │ 
 depth          │ numeric(10,2) │           │          │ 
 height         │ numeric(10,2) │           │          │ 
 width          │ numeric(10,2) │           │          │ 
 duration       │ numeric(10,2) │           │          │ 
Indexes:
    "cleaned_artworks_artist_ix" btree (artist)
    "cleaned_artworks_artwork_ix" btree (artwork)
```
En relación a nuestro objetivo sobre clasificar si una obra de arte entrante es fotografía o no, seleccionamos classification como entidad y la entrada de una nueva obra al museo como evento, dentro del esquema semantic.

```
\d semantic.entities
```

```
               Table "semantic.entities"
     Column     │ Type │ Collation │ Nullable │ Default 
════════════════╪══════╪═══════════╪══════════╪═════════
 classification │ text │           │          │ 
Indexes:
    "semantic_entities_classification_ix" btree (classification)
```

```
\d semantic.events 
```

```
                     Table "semantic.events"
     Column     │     Type      │ Collation │ Nullable │ Default 
════════════════╪═══════════════╪═══════════╪══════════╪═════════
 title          │ text          │           │          │ 
 artist         │ integer[]     │           │          │ 
 creation       │ date          │           │          │ 
 medium         │ text          │           │          │ 
 creditline     │ text          │           │          │ 
 classification │ text          │           │          │ 
 acquisition    │ date          │           │          │ 
 cataloged      │ integer       │           │          │ 
 artwork        │ integer       │           │          │ 
 diameter       │ numeric(10,2) │           │          │ 
 depth          │ numeric(10,2) │           │          │ 
 height         │ numeric(10,2) │           │          │ 
 width          │ numeric(10,2) │           │          │ 
 duration       │ numeric(10,2) │           │          │ 
Indexes:
    "semantic_events_classification_ix" btree (classification)
```

Definimos el grupo de interés  new_arrivals y la periodicidad con la que se realizará la ejecución del algoritmo de ML en el esquema de cohorts. La estructura de la tabla es la siguiente:

```
\d cohorts.new_arrivals 
```

```
                  Table "cohorts.new_arrivals"
     Column     │     Type      │ Collation │ Nullable │ Default 
════════════════╪═══════════════╪═══════════╪══════════╪═════════
 title          │ text          │           │          │ 
 artist         │ integer[]     │           │          │ 
 creation       │ date          │           │          │ 
 medium         │ text          │           │          │ 
 creditline     │ text          │           │          │ 
 classification │ text          │           │          │ 
 acquisition    │ date          │           │          │ 
 cataloged      │ integer       │           │          │ 
 artwork        │ integer       │           │          │ 
 diameter       │ numeric(10,2) │           │          │ 
 depth          │ numeric(10,2) │           │          │ 
 height         │ numeric(10,2) │           │          │ 
 width          │ numeric(10,2) │           │          │ 
 duration       │ numeric(10,2) │           │          │ 
 as_of_date     │ date          │           │          │ 
 new?           │ boolean       │           │          │ 
```
Crear etiquetas que nos ayudaran a clasificar en el futuro, en el esquema labels
```
\d labels.classified_department  

```

```
         Table "labels.classified_department"
   Column   │  Type   │ Collation │ Nullable │ Default 
════════════╪═════════╪═══════════╪══════════╪═════════
 as_of_date │ date    │           │          │ 
 artwork    │ integer │           │          │ 
 label      │ integer │           │          │ 
Indexes:
    "labels_classified_department_artwork_as_of_date_ix" btree (artwork, as_of_date)
    "labels_classified_department_artwork_ix" btree (artwork)
    "labels_classified_department_as_of_date_ix" btree (as_of_date)
```

Creamos características de las diferentes categorias.
```
\d features.aggregated 
```

```

                Table "features.aggregated"
     Column      │  Type  │ Collation │ Nullable │ Default
═════════════════╪════════╪═══════════╪══════════╪═════════
 as_of_date      │ date   │           │          │
 classification  │ text   │           │          │
 COUNT(2 meses)  │ bigint │           │          │
 COUNT(4 meses)  │ bigint │           │          │
 COUNT(8 meses)  │ bigint │           │          │
 COUNT(16 meses) │ bigint │           │          │
 totals          │ bigint │           │          │
Indexes:
    "labels_features_aggregated_as_of_date_ix" btree (as_of_date)
    "labels_features_aggregated_classification_as_of_date_ix" btree (classification)
  ```


Creamos características agregados por fecha.
 ```
                 Table "features.summary"
     Column     │  Type   │ Collation │ Nullable │ Default
════════════════╪═════════╪═══════════╪══════════╪═════════
 classification │ text    │           │          │
 artwork        │ bigint  │           │          │
 min_heigth     │ numeric │           │          │
 mean_heigth    │ numeric │           │          │
 max_heigth     │ numeric │           │          │
 min_diameter   │ numeric │           │          │
 mean_diameter  │ numeric │           │          │
 max_diameter   │ numeric │           │          │
 min_widht      │ numeric │           │          │
 mean_width     │ numeric │           │          │
 max_width      │ numeric │           │          │
 min_duration   │ numeric │           │          │
 avg_duration   │ numeric │           │          │
 max_duration   │ numeric │           │          │
 obras          │ bigint  │           │          │
Indexes:
    "features_summary_artwork_ix" btree (artwork)
```

Algunos selects útiles para verificar la información

```
select * from raw.artists limit 10;
select * from raw.artworks limit 10;
select * from cleaned.artworks limit 10;
select * from cleaned.artists limit 10;
select * from semantic.entities  limit 10;
select * from semantic.events  limit 10;
select * from cohorts.new_arrivals  limit 10;
select * from labels.classified_department  limit 10;
select * from features.aggregated limit 10;
select * from features.summary limit 10;
```

