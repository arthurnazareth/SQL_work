CREATE SCHEMA Trabalho;
USE Trabalho;

CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone1 VARCHAR(11) UNIQUE,
    telefone2 VARCHAR(11) UNIQUE,
    email VARCHAR(100) UNIQUE,
    rua VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(3)
);

create TABLE pessoa_Fisica (
	cliente_ID INT,
    cpf VARCHAR(11) UNIQUE,
    rg VARCHAR(10) UNIQUE,
    FOREIGN KEY (cliente_ID) REFERENCES Cliente(id)
);

create TABLE pessoa_Juridica (
	cliente_ID INT,
    cnpj VARCHAR(14) UNIQUE,
    ie VARCHAR(14) UNIQUE,
    FOREIGN KEY (cliente_ID) REFERENCES Cliente(id)
);


    
    