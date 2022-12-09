Create table game(
    id int generated always as identity
    multiplayer varchar(500) not null
    last_played date not null
    publish_date date 
    can_be_archived boolean
    author_id int
    primary key (id)
    foreign key (author_id) references author (id)
)

create table author(
    id int generated always as identity
    first_name varchar(500)
    last_name varchar(500)
    primary key (id)
)