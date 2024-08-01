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

INSERT INTO Cliente (nome, telefone1, telefone2, email, rua, bairro, cidade, estado)
VALUES ('Arthur','11987654321','11987654322','arthur@example.com', 'Rua A', 'Bairro A','Cidade A', 'MG');

CREATE TABLE pessoa_Fisica (
	cliente_ID INT,
    cpf VARCHAR(11) UNIQUE,
    rg VARCHAR(10) UNIQUE,
    
    FOREIGN KEY (cliente_ID) REFERENCES Cliente(id)
);

INSERT INTO pessoa_Fisica (cliente_ID, cpf, rg)
VALUES (1, '12345678901', '123456789');

CREATE TABLE pessoa_Juridica (
	cliente_ID INT,
    cnpj VARCHAR(14) UNIQUE,
    ie VARCHAR(14) UNIQUE,
    
    FOREIGN KEY (cliente_ID) REFERENCES Cliente(id)
);

INSERT INTO pessoa_Juridica (cliente_ID, cnpj, ie)
VALUES (1, '12345678000195', '12345678901234');


CREATE TABLE Editora (
	id INT AUTO_INCREMENT PRIMARY KEY,
	telefone1 VARCHAR(11) UNIQUE,
    telefone2 VARCHAR(11) UNIQUE,
    email VARCHAR(100) UNIQUE,
	nome_contato VARCHAR(100)
 );
 
INSERT INTO Editora (telefone1, telefone2, email, nome_contato)
VALUES ('11987654321', '11987654322', 'contato@editoraexemplo.com', 'Ana Silva');
 
CREATE TABLE Livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    editora_ID INT,
    valor FLOAT(4,2),
    ano VARCHAR(4),
    categoria VARCHAR(30),
    titulo VARCHAR(100),
    nome VARCHAR(100),
    isbn VARCHAR(10) UNIQUE,
    autor VARCHAR(100),
    
	FOREIGN KEY (editora_ID) REFERENCES Editora(id)
);

INSERT INTO Livro (editora_ID, valor, ano, categoria, titulo, isbn, autor)
VALUES (1, 29.99, '2023', 'Ficção', 'O Livro Exemplo', '9781234567', 'Arthur');

CREATE TABLE Estoque (
	livro_ID INT,
    estoque VARCHAR(5),
    
	FOREIGN KEY (livro_ID) REFERENCES Livro(id)
);

INSERT INTO Estoque (livro_ID, estoque)
VALUES (1, 100);


CREATE TABLE Pedido (
	id INT AUTO_INCREMENT PRIMARY KEY,
	data_ DATE,
    valor FLOAT(4,2),
    cliente_ID INT,
    
    FOREIGN KEY (cliente_ID) REFERENCES Cliente(id)
);

INSERT INTO Pedido (data_, valor, cliente_ID)
VALUES ('2024-08-01', 19.99, 1);

CREATE TABLE item_Pedido (
	pedido_ID INT,
    livro_ID INT,
    qtd_Pedido VARCHAR(10),
    valor FLOAT(4,2),
    
	FOREIGN KEY (pedido_ID) REFERENCES Pedido(id),
	FOREIGN KEY (livro_ID) REFERENCES Livro(id)
);

INSERT INTO item_Pedido (pedido_ID, livro_ID, qtd_Pedido, valor)
VALUES (1, 1, 3, 59.99);
