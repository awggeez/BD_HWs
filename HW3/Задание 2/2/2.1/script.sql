create table country
(
    id bigserial primary key
);

create table town
(
    id bigserial primary key ,
    country_id bigint not null ,
    foreign key (country_id) references country(id)
);

create table street
(
    id bigserial primary key ,
    town_id bigint not null ,
    foreign key (town_id) references town(id)
);

create table house
(
    id bigserial primary key ,
    street_id bigint not null ,
    foreign key (street_id) references street(id)
);

create table apartment
(
    id bigserial primary key ,
    house_id bigint not null ,
    foreign key (house_id) references house(id)
);