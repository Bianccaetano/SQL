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

-- Inserindo dois dados ao mesmo tempo na tabela de treino
INSERT INTO treino(diadasemana, horario, tipo)
VALUES
("2025-03-11", "09:00:00","Zumba"),
("2025-03-11", "09:00:00","Musculação");

-- Criando novos registros
INSERT INTO cliente(cpf, primeironome, sobrenome, datanasc, peso, altura, whatsapp, email, rua, numero, complemento, cep)
VALUES
(12345678911, "João", "Silva", "1990-05-15", 72.30, 1.80, "+5511998765432", "joao.silva@email.com", "Rua das Flores", 120, "Apt 301", "01234000"),
(12345678912, "Maria", "Oliveira", "1985-10=22", 58.00, 1.65, "+5511987654321", "maria.oliveira@email.com", "Avenida Paulista", 1000, "Bloco B", "01310000"),
(12345678913, "Carlos","Pereira", "1995-07-30", 85.50, 1.90, "+5511987432123", "carlos.pereira@mail.com", "Rua dos Três Corações", 350, "", "014530000"),
(12345678914, "Beatriz", "Santos", "2000-02=10", 50.70, 1.70, "+5511976543210", "beatriz.santos@dmail.com", "Rua da Paz", 555, "Sala 502", "02540000"),
(12345678915, "Lucas", "Costa", "1992-11-05", 77.40, 1.78, "+5511998764321", "lucas.costa@email.com", "Praça da Liberdade", 300, "", "03120000");


--Criando uma tabela para pagamento
CREATE TABLE pagamento(
id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
valor DECIMAL(5,2) NOT NULL,
data_pagamento DATE NOT NULL,
cpf BIGINT,
FOREIGN KEY (cpf) REFERENCES cliente(cpf)
);

--Inserir registros para pagamento
INSERT INTO pagamento(valor, data_pagamento, cpf)
VALUES
(150.00, "2025-03-01",12345678911), -- Pagamento de João
(200.00, "2025-03-05",12345678912), -- Pagamento de Maria
(300.00, "2025-03-10",12345678913), -- Pagamento de Carlos
(250.00, "2025-03-02",12345678911), -- Outro pagamento de João
(100.00, "2025-03-03",12345678915); -- Pagamento de Lucas

-- Alterar registros de uma linha
UPDATE treino
SET diadasemana = "2025-03-14"
WHERE tipo = "Musculação" AND diadasemana = "2025-03-11";


-- Alterar registros em duas linhas ao mesmo tempo
UPDATE treino
SET horario = "15:00:00"
WHERE horario IN ("09:00:00", "09:00:00" );


-- Alterando dois registros diferentes na tabela
UPDATE cliente
SET peso = 60.50, datanasc = "2000-09-17"
WHERE cpf = 12345678910;

-- Read - Selecionandoo todos os dados da tabela
SELECT * FROM treino;

-- Selecionando apenas uma coluna e mostrando os dados dela
SELECT tipo FROM treino;

-- Selecionando duas colunas ao mesmo tempo
SELECT diadasemana, horario FROM treino;

--Selecionando valores entre dois dados
SELECT * FROM cliente
WHERE datanasc BETWEEN "1992-01-01" AND "2000-12-31";

SELECT * FROM cliente
WHERE peso BETWEEN 66 AND 100;

SELECT * FROM cliente
WHERE peso = 60.50 OR peso = 100;

--Somar todos os pesos do registro
SELECT SUM(peso) AS soma_peso FROM cliente;

--Contar quantos registros eu tenho na tabela de clientes
SELECT COUNT(*) AS total_registros FROM cliente;

--Selecionando alturas maior que e menor que
SELECT * FROM cliente
WHERE altura > 1.78;

SELECT * FROM cliente
WHERE altura < 1.70;

--combinando maior que e menor que
SELECT * FROM cliente
WHERE altura > 1.78 OR altura < 1.70;


-- Inner Join (Select com chave estrangeira)
SELECT
    c.cpf,
    c.primeironome,
    c.sobrenome,
    p.valor,
    p.data_pagamento
FROM
    cliente c 
INNER JOIN 
    pagamento p ON c.cpf = p.cpf
WHERE
    c.cpf = 12345678911;

    
-- Deletando um banco de dados
DROP DATABASE anafit;

-- Deletando uma tabela
DROP TABLE treino;
DROP TABLE cliente;

-- Deletando um dado/registro específico na tabela
DELETE FROM treino WHERE  tipo = "Musculação"

-- Deletando TODOS os regidtros de tabela
DELETE FROM treino;