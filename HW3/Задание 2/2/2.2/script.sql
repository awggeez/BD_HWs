create table team
(
    name varchar(255) primary key
);

create table referee
(
    id bigserial primary key
);

create table match
(
    id bigserial primary key ,
    team1 varchar(255) not null ,
    team2 varchar(255) not null ,
    referee_id bigint,
    foreign key (team1) references team(name),
    foreign key (team2) references team(name),
    foreign key (referee_id) references referee(id)
);