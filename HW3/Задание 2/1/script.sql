create table publisher
(
    id bigserial primary key,
    address varchar(255),
    name varchar(255)
);

create table book
(
    isbn varchar(255) primary key,
    author varchar(255),
    pages int,
    title varchar(255),
    year int,
    publisher int,
    foreign key (publisher) references publisher(id)
);

create table book_copy
(
    copy_number bigserial primary key ,
    location varchar(255),
    book_id varchar(255) not null,
    foreign key (book_id) references book(isbn)
);

create table category
(
    name varchar(255) primary key,
    parent_id varchar(255),
    foreign key (parent_id) references category(name)
);

create table reader_entity
(
    pers_number int primary key ,
    address varchar(255),
    birth_date varchar(32),
    firstname varchar(32),
    lastname varchar(32)
);

create table borrowing
(
    id bigserial primary key ,
    return_date timestamp,
    reader_entity_id bigint,
    foreign key (reader_entity_id) references reader_entity(pers_number)
);

create table book_category
(
    book_id varchar(255),
    category_id varchar(255),
    foreign key (book_id) references book(isbn),
    foreign key (category_id) references category(name)
);

create table book_copy_reader_entity
(
    book_copy_id bigint,
    reader_entity_id bigint,
    foreign key (book_copy_id) references book_copy(copy_number),
    foreign key (reader_entity_id) references reader_entity(pers_number)
);