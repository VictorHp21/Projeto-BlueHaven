create database `loja_st`;

use railway;

-- permisao

CREATE USER 'appsmith_user'@'%' IDENTIFIED BY '121314';

GRANT ALL PRIVILEGES ON railway.* TO 'appsmith_user'@'%';
FLUSH PRIVILEGES;




CREATE TABLE Clientes (
    IdCliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(40) NOT NULL,
    Endereco VARCHAR(100),
    CPF CHAR(11)
);

CREATE TABLE Vendedores (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  senha_hash VARCHAR(255) NOT NULL,
  data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- insert vendedores

INSERT INTO funcionario (nome, sobrenome, email, senha_hash)
VALUES (
  {{ Input_Nome.text }},
  {{ Input_Sobrenome.text }},
  {{ Input_Email.text }},
  SHA2({{ Input_Senha.text }}, 256)
);

INSERT INTO Vendedores (nome,  email, senha_hash)
VALUES (
  'João',
  'joao.silva@example.com',
  SHA2('Senha123!', 256)
);




-- inserindo

INSERT INTO Clientes (Nome, Endereco, CPF) VALUES
('João Silva', 'Rua das Flores, 123', '12345678901'),
('Maria Oliveira', 'Avenida Central, 456', '23456789012'),
('Carlos Pereira', 'Travessa da Paz, 78', '34567890123'),
('Ana Souza', 'Rua Nova, 90', '45678901234'),
('Lucas Santos', 'Alameda das Acácias, 55', '56789012345');







CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(idCliente)
);

ALTER TABLE pedido
ADD COLUMN id_vendedor INT NOT NULL,
ADD CONSTRAINT fk_pedido_vendedor
FOREIGN KEY (id_vendedor) REFERENCES vendedores(idVendedor);


CREATE TABLE itens_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    produto VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    telefone VARCHAR(15)
);

CREATE TABLE enderecos (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    logradouro VARCHAR(150),
    numero VARCHAR(10),
    bairro VARCHAR(60),
    cidade VARCHAR(60),
    estado CHAR(2),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

