create database if not exists Biblioteca;

use Biblioteca;

create table if not exists Autor(
	ID int primary key auto_increment,
    Nome varchar(255) not null,
    Data_nasc date not null
);

insert into Autor (Nome, Data_nasc)
	values ("George Orwell", '1903-06-23'),
    ("Haruki Murakami", '1949-01-12');
		

create table if not exists Livro(
	ISBN int primary key auto_increment,
    Titulo varchar(255) not null,
    Ano int not null,
    id_autor int not null,
    
    constraint id_autor_fk
    foreign key(id_autor) references Autor(ID)
    on update cascade
    on delete restrict
);

insert into Livro (Titulo, Ano, id_autor)
	values("1984", 1948, 1), ("Caçando Carneiros", 1982, 2);

create table if not exists Aluga(
	ID int primary key auto_increment,
    Data_emprestimo date not null,
    Devolvido boolean not null,
    isbn_livro int not null,
    
    constraint isbn_livro_fk
    foreign key (isbn_livro) references Livro(ISBN)
	on update cascade
    on delete restrict
);

create table if not exists Pessoa (
	CPF varchar(11) primary key,
    nome varchar(255) not null,
    data_nasc date not null,
    altura float,
    peso float,
    dinheiro float not null default 0.0,
    id_aluga int not null,
    
    constraint id_aluga_fk
    foreign key (id_aluga) references Aluga(ID)
    on update cascade
    on delete restrict
);

select * from Autor;
select * from Livro