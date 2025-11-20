create database `bluehaven`;

use bluehaven;

-- permisao






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

INSERT INTO Clientes (Nome, Endereco, CPF) VALUES
('Clovis basilio', 'thcurusbangos, 69', '1234567977');

INSERT INTO Clientes (Nome, Endereco, CPF) VALUES
('Fernanda Lima', 'Rua dos Girassóis, 12', '67890123456'),
('Ricardo Mendes', 'Avenida das Palmeiras, 345', '78901234567'),
('Patrícia Rocha', 'Rua São Pedro, 89', '89012345678'),
('Gustavo Almeida', 'Travessa Bela Vista, 10', '90123456789'),
('Camila Ferreira', 'Rua Dom Pedro II, 240', '01234567890'),
('Eduardo Nunes', 'Avenida Brasil, 500', '11223344556'),
('Juliana Martins', 'Rua das Laranjeiras, 77', '22334455667'),
('Rafael Costa', 'Alameda dos Ipês, 102', '33445566778'),
('Beatriz Ramos', 'Rua da Liberdade, 300', '44556677889'),
('Thiago Barros', 'Rua Santo Antônio, 66', '55667788990'),
('Larissa Pinto', 'Avenida Atlântica, 900', '66778899001'),
('André Carvalho', 'Rua do Comércio, 120', '77889900112'),
('Natália Teixeira', 'Travessa São João, 45', '88990011223'),
('Felipe Araújo', 'Rua dos Cravos, 15', '99001122334'),
('Sabrina Duarte', 'Avenida Horizonte, 250', '10111213141');








CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(idCliente)
);

ALTER TABLE pedido
ADD COLUMN id_vendedor INT NOT NULL,
ADD CONSTRAINT fk_pedido_vendedor
FOREIGN KEY (id_vendedor) REFERENCES Vendedores(id);


CREATE TABLE itens_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES estoque(id_produto)
);


ALTER TABLE itens_pedido
DROP COLUMN produto;


ALTER TABLE itens_pedido
DROP COLUMN preco_unitario;

ALTER TABLE itens_pedido
DROP COLUMN produto, DROP COLUMN preco_unitario;

ALTER TABLE itens_pedido
ADD COLUMN id_produto INT NOT NULL,
ADD FOREIGN KEY (id_produto) REFERENCES estoque(id_produto);

CREATE OR REPLACE VIEW itens_com_valor AS
SELECT 
    i.id_item,
    i.id_pedido,
    e.nome_produto AS produto,
    e.categoria,
    i.quantidade,
    (i.quantidade * e.preco) AS valor
FROM itens_pedido i
JOIN estoque e ON i.id_produto = e.id_produto;





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

CREATE TABLE estoque (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    tamanho VARCHAR(20),
    categoria VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL
);

INSERT INTO estoque (nome_produto, tamanho, categoria, preco, quantidade) VALUES
('Camiseta Preta', 'M', 'Vestuário', 79.90, 25),
('Tênis Esportivo', '42', 'Calçados', 299.90, 15),
('Calça Jeans', 'G', 'Vestuário', 149.90, 10),
('Boné Azul', 'Único', 'Acessórios', 59.90, 30),
('Relógio Digital', 'Único', 'Acessórios', 249.90, 8);

INSERT INTO estoque (nome_produto, tamanho, categoria, preco, quantidade) VALUES
('Moletom Oversized Cinza', 'G', 'Vestuário', 229.90, 12),
('Jaqueta Corta-Vento Preta', 'M', 'Vestuário', 279.90, 10),
('Camiseta Gráfica Skull', 'G', 'Vestuário', 119.90, 20),
('Calça Cargo Bege', 'M', 'Vestuário', 189.90, 15),
('Boné Trucker Preto e Branco', 'Único', 'Acessórios', 89.90, 25),
('Tênis Chunky Branco', '41', 'Calçados', 399.90, 10),
('Bermuda Sarja Street', 'G', 'Vestuário', 159.90, 18),
('Camiseta Oversized Flame', 'GG', 'Vestuário', 129.90, 22),
('Jaqueta Jeans Destroyed', 'M', 'Vestuário', 319.90, 8),
('Touca Beanie Preta', 'Único', 'Acessórios', 69.90, 30);





INSERT INTO fornecedores (nome, cnpj, telefone) VALUES
('Urban Vibe Clothing', '12.345.678/0001-90', '(11) 98877-1122'),
('StreetCode Apparel', '23.456.789/0001-81', '(21) 97766-3344'),
('Raw District Wear', '34.567.890/0001-72', '(31) 96655-7788'),
('NoRules Street Co.', '45.678.901/0001-63', '(41) 95544-9900'),
('HypeCulture Supply', '56.789.012/0001-54', '(51) 94433-2211'),
('Downtown Drip', '67.890.123/0001-45', '(61) 93322-4455'),
('Concrete Jungle Wear', '78.901.234/0001-36', '(71) 92211-6677'),
('OffGrid Street Lab', '89.012.345/0001-27', '(81) 91100-8899'),
('Midnight Society', '90.123.456/0001-18', '(91) 90099-7788'),
('Rebel Roots Supply', '01.234.567/0001-09', '(85) 98888-5566');


-- inserindo pedidos

INSERT INTO pedido (data_pedido, id_cliente, id_vendedor) VALUES
('2025-10-01', 1, 1),
('2025-10-02', 2, 1),
('2025-10-03', 3, 1),
('2025-10-04', 4, 1),
('2025-10-05', 5, 1),
('2025-10-06', 1, 1),
('2025-10-07', 2, 1),
('2025-10-08', 3, 1),
('2025-10-09', 4, 1),
('2025-10-10', 5, 1);

-- Pedido 1
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(1, 1, 2), -- 2 Camisetas Pretas
(1, 3, 1); -- 1 Calça Jeans

-- Pedido 2
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(2, 2, 1), -- 1 Tênis Esportivo
(2, 4, 2); -- 2 Bonés Azuis

-- Pedido 3
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(3, 5, 1); -- 1 Relógio Digital

-- Pedido 4
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(4, 1, 3); -- 3 Camisetas Pretas

-- Pedido 5
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(5, 2, 1),
(5, 3, 2);

-- Pedido 6
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(6, 4, 1);

-- Pedido 7
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(7, 1, 1),
(7, 5, 1);

-- Pedido 8
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(8, 3, 1);

-- Pedido 9
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(9, 2, 2),
(9, 4, 1);

-- Pedido 10
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(10, 5, 2);


CREATE OR REPLACE VIEW vw_itens_pedido AS
SELECT 
    p.id_pedido,
    c.Nome AS cliente,
    v.nome AS vendedor,
    e.nome_produto AS produto,
    i.quantidade,
    (i.quantidade * e.preco) AS valor,
    p.data_pedido
FROM itens_pedido i
JOIN pedido p ON i.id_pedido = p.id_pedido
JOIN estoque e ON i.id_produto = e.id_produto
JOIN Clientes c ON p.id_cliente = c.IdCliente
JOIN Vendedores v ON p.id_vendedor = v.id;

-- INSERIR PEDIDO

INSERT INTO pedido (data_pedido, id_cliente, id_vendedor) VALUES
('2025-03-10', 5, 3);

-- INSERIR ITENS_PEDIDO

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(11, 3, 10);







