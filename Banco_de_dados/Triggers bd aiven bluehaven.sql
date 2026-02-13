-- TRIGGERS

-- Trigger  Clientes
CREATE TRIGGER trg_clientes_insert
AFTER INSERT ON Clientes
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_novos)
VALUES (
    'Clientes',
    'INSERT',
    @usuario_ativo,
    CONCAT('{"IdCliente":', NEW.IdCliente, ', "Nome":"', NEW.Nome, '", "CPF":"', NEW.CPF, '"}')
);

DROP TRIGGER trg_clientes_insert;


-- Trigger de UPDATE
CREATE TRIGGER trg_clientes_update
AFTER UPDATE ON Clientes
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_anteriores, dados_novos)
VALUES (
    'Clientes',
    'UPDATE',
    @usuario_ativo,
    CONCAT('{"IdCliente":', OLD.IdCliente, ', "Nome":"', OLD.Nome, '", "CPF":"', OLD.CPF, '"}'),
    CONCAT('{"IdCliente":', NEW.IdCliente, ', "Nome":"', NEW.Nome, '", "CPF":"', NEW.CPF, '"}')
);

-- Trigger de DELETE
CREATE TRIGGER trg_clientes_delete
AFTER DELETE ON Clientes
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_anteriores)
VALUES (
    'Clientes',
    'DELETE',
    @usuario_ativo,
    CONCAT('{"IdCliente":', OLD.IdCliente, ', "Nome":"', OLD.Nome, '", "CPF":"', OLD.CPF, '"}')
);


-- Triggers vendedores

CREATE TRIGGER trg_vendedores_insert
AFTER INSERT ON Vendedores
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_novos)
VALUES (
    'Vendedores',
    'INSERT',
    @usuario_ativo,
    CONCAT('{"id":', NEW.id, ', "nome":"', NEW.nome, '", "email":"', NEW.email, '"}')
);

CREATE TRIGGER trg_vendedores_update
AFTER UPDATE ON Vendedores
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_anteriores, dados_novos)
VALUES (
    'Vendedores',
    'UPDATE',
    @usuario_ativo,
    CONCAT('{"id":', OLD.id, ', "nome":"', OLD.nome, '", "email":"', OLD.email, '"}'),
    CONCAT('{"id":', NEW.id, ', "nome":"', NEW.nome, '", "email":"', NEW.email, '"}')
);

CREATE TRIGGER trg_vendedores_delete
AFTER DELETE ON Vendedores
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_anteriores)
VALUES (
    'Vendedores',
    'DELETE',
    @usuario_ativo,
    CONCAT('{"id":', OLD.id, ', "nome":"', OLD.nome, '", "email":"', OLD.email, '"}')
);


-- Triggers Pedidos

-- INSERT
CREATE TRIGGER trg_pedido_insert
AFTER INSERT ON pedido
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_novos)
VALUES (
    'pedido',
    'INSERT',
    @usuario_ativo,
    CONCAT('{"id_pedido":', NEW.id_pedido,
           ', "data_pedido":"', NEW.data_pedido,
           '", "id_cliente":', NEW.id_cliente,
           ', "id_vendedor":', NEW.id_vendedor, '}')
);

-- UPDATE
CREATE TRIGGER trg_pedido_update
AFTER UPDATE ON pedido
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_anteriores, dados_novos)
VALUES (
    'pedido',
    'UPDATE',
    @usuario_ativo,
    CONCAT('{"id_pedido":', OLD.id_pedido,
           ', "data_pedido":"', OLD.data_pedido,
           '", "id_cliente":', OLD.id_cliente,
           ', "id_vendedor":', OLD.id_vendedor, '}'),
    CONCAT('{"id_pedido":', NEW.id_pedido,
           ', "data_pedido":"', NEW.data_pedido,
           '", "id_cliente":', NEW.id_cliente,
           ', "id_vendedor":', NEW.id_vendedor, '}')
);

-- DELETE
CREATE TRIGGER trg_pedido_delete
AFTER DELETE ON pedido
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_anteriores)
VALUES (
    'pedido',
    'DELETE',
    @usuario_ativo,
    CONCAT('{"id_pedido":', OLD.id_pedido,
           ', "data_pedido":"', OLD.data_pedido,
           '", "id_cliente":', OLD.id_cliente,
           ', "id_vendedor":', OLD.id_vendedor, '}')
);


-- Triggers itens_pedido

-- INSERT
CREATE TRIGGER trg_itens_pedido_insert
AFTER INSERT ON itens_pedido
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_novos)
VALUES (
    'itens_pedido',
    'INSERT',
    @usuario_ativo,
    CONCAT('{"id_item":', NEW.id_item,
           ', "id_pedido":', NEW.id_pedido,
           ', "id_produto":', NEW.id_produto,
           ', "quantidade":', NEW.quantidade, '}')
);

-- UPDATE
CREATE TRIGGER trg_itens_pedido_update
AFTER UPDATE ON itens_pedido
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_anteriores, dados_novos)
VALUES (
    'itens_pedido',
    'UPDATE',
    @usuario_ativo,
    CONCAT('{"id_item":', OLD.id_item,
           ', "id_pedido":', OLD.id_pedido,
           ', "id_produto":', OLD.id_produto,
           ', "quantidade":', OLD.quantidade, '}'),
    CONCAT('{"id_item":', NEW.id_item,
           ', "id_pedido":', NEW.id_pedido,
           ', "id_produto":', NEW.id_produto,
           ', "quantidade":', NEW.quantidade, '}')
);

-- DELETE
CREATE TRIGGER trg_itens_pedido_delete
AFTER DELETE ON itens_pedido
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_anteriores)
VALUES (
    'itens_pedido',
    'DELETE',
    @usuario_ativo,
    CONCAT('{"id_item":', OLD.id_item,
           ', "id_pedido":', OLD.id_pedido,
           ', "id_produto":', OLD.id_produto,
           ', "quantidade":', OLD.quantidade, '}')
);


-- Triggers Estoque

-- INSERT
CREATE TRIGGER trg_estoque_insert
AFTER INSERT ON estoque
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_novos)
VALUES (
    'estoque',
    'INSERT',
    @usuario_ativo,
    CONCAT('{"id_produto":', NEW.id_produto,
           ', "nome_produto":"', NEW.nome_produto,
           '", "categoria":"', NEW.categoria,
           '", "preco":', NEW.preco,
           ', "quantidade":', NEW.quantidade, '}')
);

-- UPDATE
CREATE TRIGGER trg_estoque_update
AFTER UPDATE ON estoque
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_anteriores, dados_novos)
VALUES (
    'estoque',
    'UPDATE',
    @usuario_ativo,
    CONCAT('{"id_produto":', OLD.id_produto,
           ', "nome_produto":"', OLD.nome_produto,
           '", "categoria":"', OLD.categoria,
           '", "preco":', OLD.preco,
           ', "quantidade":', OLD.quantidade, '}'),
    CONCAT('{"id_produto":', NEW.id_produto,
           ', "nome_produto":"', NEW.nome_produto,
           '", "categoria":"', NEW.categoria,
           '", "preco":', NEW.preco,
           ', "quantidade":', NEW.quantidade, '}')
);

-- DELETE
CREATE TRIGGER trg_estoque_delete
AFTER DELETE ON estoque
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_anteriores)
VALUES (
    'estoque',
    'DELETE',
    @usuario_ativo,
    CONCAT('{"id_produto":', OLD.id_produto,
           ', "nome_produto":"', OLD.nome_produto,
           '", "categoria":"', OLD.categoria,
           '", "preco":', OLD.preco,
           ', "quantidade":', OLD.quantidade, '}')
);


-- Triggers Fornecedores

-- INSERT
CREATE TRIGGER trg_fornecedores_insert
AFTER INSERT ON fornecedores
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_novos)
VALUES (
    'Fornecedores',
    'INSERT',
    @usuario_ativo,
    CONCAT('{"id_fornecedor":', NEW.id_fornecedor, ', "nome":"', NEW.nome, '", "cnpj":"', NEW.cnpj, '", "telefone":"', NEW.telefone, '"}')
);

-- UPDATE
CREATE TRIGGER trg_fornecedores_update
AFTER UPDATE ON fornecedores
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_anteriores, dados_novos)
VALUES (
    'Fornecedores',
    'UPDATE',
    @usuario_ativo,
    CONCAT('{"id_fornecedor":', OLD.id_fornecedor, ', "nome":"', OLD.nome, '", "cnpj":"', OLD.cnpj, '", "telefone":"', OLD.telefone, '"}'),
    CONCAT('{"id_fornecedor":', NEW.id_fornecedor, ', "nome":"', NEW.nome, '", "cnpj":"', NEW.cnpj, '", "telefone":"', NEW.telefone, '"}')
);

-- DELETE
CREATE TRIGGER trg_fornecedores_delete
AFTER DELETE ON fornecedores
FOR EACH ROW
INSERT INTO Log_Auditoria (tabela, operacao, usuario, dados_anteriores)
VALUES (
    'Fornecedores',
    'DELETE',
    @usuario_ativo,
    CONCAT('{"id_fornecedor":', OLD.id_fornecedor, ', "nome":"', OLD.nome, '", "cnpj":"', OLD.cnpj, '", "telefone":"', OLD.telefone, '"}')
);


-- Show

show triggers;
