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
