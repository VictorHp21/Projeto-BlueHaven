-- TABELA PEDIDO
DROP TABLE IF EXISTS pedido;

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(IdCliente),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedores(id)
);

-- TABELA ITENS_PEDIDO
DROP TABLE IF EXISTS itens_pedido;

CREATE TABLE itens_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES estoque(id_produto)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- view ultimos pedidos

CREATE OR REPLACE VIEW vw_ultimos_pedidos AS
SELECT 
    p.id_pedido,
    p.data_pedido,
    c.Nome AS cliente,
    v.nome AS vendedor,
    e.nome_produto AS produto,
    i.quantidade,
    e.preco,
    (i.quantidade * e.preco) AS valor_total
FROM pedido p
JOIN Clientes c ON p.id_cliente = c.IdCliente
JOIN Vendedores v ON p.id_vendedor = v.id
JOIN itens_pedido i ON p.id_pedido = i.id_pedido
JOIN estoque e ON i.id_produto = e.id_produto
ORDER BY p.data_pedido DESC
LIMIT 5;

-- NOVOS PEDIDOS
INSERT INTO pedido (data_pedido, id_cliente, id_vendedor) VALUES
('2025-10-21', 2, 5),
('2025-10-22', 4, 6),
('2025-10-23', 12, 5),
('2025-10-24', 21, 7),
('2025-10-25', 10, 7);

-- ITENS DO PEDIDO 1 (id_pedido = 1º novo)
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
( 4, 17, 1),  -- 
( 4, 9, 1);  -- Boné Trucker

-- ITENS DO PEDIDO 2
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(3, 10, 1), -- Tênis Chunky Branco
( 3, 13, 2); -- Camiseta Oversized Flame

-- ITENS DO PEDIDO 3
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(2, 9, 1),  -- Moleton oversized
(2, 8, 1);  -- Calça Cargo Bege

-- ITENS DO PEDIDO 4
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
( 1, 15, 2); -- Touca Beanie Preta

-- ITENS DO PEDIDO 5
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(5, 11, 1),  -- Bermuda Sarja Street
(5, 14, 1);  -- Jaqueta Jeans Destroyed



