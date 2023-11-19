create table if not exists Единицы_измерения (
	Наименование_единицы_измерения varchar(60) primary key
);

create table if not exists Товары (
	ID_товара serial primary key,
	Наименование_товара varchar(255),
	Цена_закупки money,
	Количество_закупленного_товара int,
	Дата_закупки date,
	Наименование_единицы_измерения varchar(60) references Единицы_измерения (Наименование_единицы_измерения)
);

create table if not exists Продавцы (
	ID_продавца serial primary key,
	Фамилия varchar(100) not null,
	Имя varchar(100) not null,
	Отчество varchar(100) null,
	Процент_комиссионных int,
	Телефон varchar(15),
	Email varchar(100),
	Адрес varchar(255)
);

create table if not exists Товары_Продавцы (
	ID_товара_продавца serial primary key,
	ID_товара int references Товары (ID_товара),
	ID_продавца int references Продавцы (ID_продавца)
);

create table if not exists Продажи (
	ID_продажи serial primary key,
	Цена_продажи money,
	Количество_проданного_товара int,
	Дата_продажи date,
	ID_товара_продавца int references Товары_Продавцы (ID_товара_продавца)
);
