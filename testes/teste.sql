create database clickbuy;
use clickbuy;
create table usuario(
id int auto_increment primary key,
nome varchar(150) not null,
username varchar(150) not null unique,
email varchar(150) not null unique,
senha varchar(100) not null,
telefone varchar(11) not null unique,
cpf varchar(14) not null unique,
cep varchar(8) not null,
endereco int,
FOREIGN KEY (endereco) REFERENCES enderecos(id) on delete cascade on update cascade
);
create table enderecos(
id int auto_increment primary key,
pais varchar(20) not null,
estado char(2) not null,
cidade varchar(20) not null,
bairro varchar(30) not null,
endereco varchar(100) not null,
numero int not null,
complemento varchar(30)
);
create table produto(ID int auto_increment primary key,
nome varchar(300) not null,
descricao varchar(1200) not null,
preco float not null,
vendedor int not null,
estoque int not null
);
create table categoria(
id int auto_increment primary key,
nome varchar(30) not null unique
);
create table categoriaprod(
categoria int not null,
produto int not null,
FOREIGN KEY (categoria) REFERENCES categoria(id) on delete cascade on update cascade,
FOREIGN KEY (produto) REFERENCES produto(ID) on delete cascade on update cascade
);
create table avaliacao(id int auto_increment primary key,
usuario int not null,
avaliacao DECIMAL(2,1) NOT NULL CHECK (nota >= 0.0 AND nota <= 5.0),
comentario varchar(600),
produto int not null,
FOREIGN KEY (produto) REFERENCES produto(ID) on delete cascade on update cascade,
FOREIGN KEY (usuario) REFERENCES usuario(id) on delete cascade on update cascade
);