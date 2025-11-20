SELECT COUNT(*) AS total_clientes
FROM Clientes;

SELECT SUM(quantidade) AS total_pecas_em_estoque
FROM estoque;

INSERT INTO pedido (data_pedido,id_cliente,id_vendedor) VALUES ('{{(Table1.newRow || {}).data_pedido}}','{{(Table1.newRow || {}).id_cliente}}','{{(Table1.newRow || {}).id_vendedor}}')

SELECT 
  p.id_pedido,
  p.data_pedido,
  c.Nome AS cliente,
  v.nome AS vendedor,
  i.produto,
  i.quantidade,
  i.preco_unitario,
  (i.quantidade * i.preco_unitario) AS total_item
FROM pedido p
JOIN itens_pedido i ON p.id_pedido = i.id_pedido
JOIN Clientes c ON p.id_cliente = c.IdCliente
JOIN Vendedores v ON p.id_vendedor = v.id
ORDER BY p.data_pedido DESC;

UPDATE pedido SET data_pedido= '{{Table1.updatedRow.data_pedido}}', id_cliente= '{{Table1.updatedRow.id_cliente}}', id_vendedor= '{{Table1.updatedRow.id_vendedor}}' WHERE id_pedido= '{{Table1.updatedRow.id_pedido}}';


SELECT 
    ROUND(SUM(i.quantidade * e.preco), 2) AS total_vendas
FROM 
    pedido p
JOIN 
    itens_pedido i ON p.id_pedido = i.id_pedido
JOIN 
    estoque e ON i.id_produto = e.id_produto;

SELECT *
FROM vw_itens_pedido
ORDER BY data_pedido DESC
LIMIT 5;
