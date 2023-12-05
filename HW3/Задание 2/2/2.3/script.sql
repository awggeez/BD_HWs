create table another_parent
(
    id bigserial primary key
);

create table man
(
    id bigserial primary key ,
    parent_man_id bigint,
    parent_woman_id bigint,
    foreign key (parent_man_id) references man(id),
    foreign key (parent_woman_id) references another_parent(id)
);

create table woman
(
    id bigserial primary key ,
    parent_man_id bigint,
    parent_woman_id bigint,
    foreign key (parent_woman_id) references woman(id),
    foreign key (parent_man_id) references another_parent(id)
);