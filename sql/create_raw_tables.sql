create schema if not exists raw;

drop table if exists raw.artists;

create table raw.artists (
  "ConstituentID" TEXT,
  "DisplayName" TEXT,
  "ArtistBio" TEXT,
  "Nationality" TEXT,
  "Gender" TEXT,
  "BeginDate" TEXT,
  "EndDate" TEXT,
  "Wiki QID" TEXT,
  "ULAN" TEXT  
);

comment on table raw.artists is 'describe las características estáticas de los artistas';


drop table if exists raw.artworks;

create table raw.artworks (
  "Title" TEXT,
  "Artist" TEXT,
  "ConstituentID" TEXT,
  "ArtistBio" TEXT,
  "Nationality" TEXT,
  "BeginDate" TEXT,
  "EndDate" TEXT,
  "Gender" TEXT,
  "Date" TEXT,
  "Medium" TEXT,
  "Dimensions" TEXT,
  "CreditLine" TEXT,
  "AccessionNumber" TEXT,
  "Classification" TEXT,
  "Department" TEXT,
  "DateAcquired" TEXT,
  "Cataloged" TEXT,
  "ObjectID" TEXT,
  "URL" TEXT,
  "ThumbnailURL" TEXT,
  "Circumference (cm)"  TEXT,
  "Depth (cm)" TEXT,
  "Diameter (cm)" TEXT,
  "Height (cm)" TEXT,
  "Length (cm)" TEXT,
  "Weight (kg)" TEXT,
  "Width (cm)" TEXT,
  "Seat Height (cm)" TEXT,
  "Duration (sec.)" TEXT
);

comment on table raw.artworks is 'describe las características estáticas de las obras de arte';