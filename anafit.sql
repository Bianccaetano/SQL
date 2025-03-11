-- Criando banco de dados
CREATE DATABASE anafit;

-- Criando primeira tabela
CREATE TABLE cliente(
cpf bigint(11) PRIMARY KEY,
primeironome varchar (50) NOT NULL,
sobrenome varchar (50) NOT NULL,
datanasc date NOT NULL,
peso decimal (5,2),
altura float (3,2),
whatsapp varchar (15) NOT NULL,
email varchar (100) UNIQUE NOT NULL,
rua varchar (100) NOT NULL,
numero int (6) NOT NULL,
complemento varchar (100),
cep varchar (8) NOT NULL
);

-- Inserindo dados na tabela de clientes
INSERT INTO cliente(cpf, primeironome, sobrenome, datanasc, peso, altura, whatsapp, email, rua, numero, complemento, cep)
VALUES(12345678910, "Ana Claudia", "Cunha", "2014-09-17", 63.50, 1.73, "+551140028922", "ana.cscunha1@senacsp.edu.br", "Rua Dr Antônio Bento", 393, "", "04750000");

CREATE TABLE treino(
diadasemana date NOT NULL,
horario time NOT NULL,
tipo varchar(50) NOT NULL
); 

-- Inserindo dados na tabela de treinos
INSERT INTO treino(diadasemana, horario, tipo)
VALUES
("2025-03-11", "09:00:00","Zumba"),
("2025-03-11", "18:00:00","Musculação");

-- Deletando uma tabela
DROP TABLE treino;

DROP TABLE cliente;

-- Deletando um banco de dados
DROP DATABASE anafit;
