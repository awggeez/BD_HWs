create table entity
(
    id   int primary key,
    name varchar(255)
);

create table entity_attribute
(
    name   varchar(255),
    key    varchar(255) primary key,
    entity int references entity (id)
);

create table connection
(
    id   int primary key,
    name varchar(255)
);

create table connection_attribute
(
    name          varchar(255),
    connection_id int primary key references connection (id)
);

create table participation
(
    func       varchar(255),
    role       varchar(255),
    min        varchar(255),
    max        varchar(255),
    entity_id  int references entity (id),
    connect_id int references connection (id)
);