create table city
(
    region varchar(255) ,
    name varchar(255) ,
    primary key (region, name)
);

create table station
(
    name varchar(255) primary key ,
    tracks int not null,
    city varchar(255),
    foreign key (name, city) references city(region, name)
);

create table train
(
    train_nr int primary key,
    length int not null,
    station_name_start varchar(255),
    station_name_end varchar(255),
    foreign key (station_name_start) references station(name),
    foreign key (station_name_end) references station(name)
);

create table connected
(
    station_name varchar(255),
    train_nr int,
    departure timestamp(255),
    arrival timestamp,
    primary key (station_name, train_nr),
    foreign key (station_name) references station(name)
);
