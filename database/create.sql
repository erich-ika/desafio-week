create table customer (
    id    int(10) auto_increment
        primary key,
    name  varchar(45) not null,
    phone varchar(15) null,
    hash  varchar(64) not null,
    constraint customer_phone_uindex
        unique (phone)
);

create table service (
    id    int auto_increment
        primary key,
    name  varchar(45)    not null,
    price decimal(10, 2) not null,
    constraint service_name_uindex
        unique (name)
);

create table appointment (
    date     date not null,
    time     int  not null,
    customer int  not null,
    service  int  not null,
    primary key (date, time),
    constraint appoitment_customer_id_fk
        foreign key (customer) references customer (id),
    constraint appoitment_service_id_fk
        foreign key (service) references service (id)
);
