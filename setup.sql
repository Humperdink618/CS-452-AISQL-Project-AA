create table movie (
    movie_id integer primary key,
    name varchar(50) not null,
    release_date date not null,
    rating varchar(6) not null,
    director_id integer not null,
    producer_id integer not null,
    box_office float not null,
    budget float not null,
    imdb_score float not null,
    foreign key (director_id) references director (director_id),
    foreign key (producer_id) references producer (producer_id)
);

create table director (
    director_id integer primary key,
    name varchar(50),
    birth_date date
);

create table producer (
    producer_id integer primary key,
    name varchar(50),
    birth_date date
);