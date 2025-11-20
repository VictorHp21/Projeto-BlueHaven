SELECT IdCliente, Nome FROM Clientes;

SELECT LAST_INSERT_ID() AS id_pedido;

SELECT 
  p.data_pedido,
  p.id_cliente,
  p.id_vendedor,
  i.id_produto,
  i.quantidade
FROM pedido p
JOIN itens_pedido i ON p.id_pedido = i.id_pedido
WHERE p.id_pedido = {{ Select_edit_pedido_venda.selectedOptionValue }};

SELECT p.id_pedido, c.Nome AS cliente
FROM pedido p
JOIN Clientes c ON p.id_cliente = c.IdCliente;


INSERT INTO itens_pedido (id_pedido, id_produto, quantidade)
VALUES (
  {{ Insert_Pedido.data[0].id_pedido }},
  {{ Select_produto.selectedOptionValue }},
  {{ InputQTD.text }}
);

INSERT INTO pedido (data_pedido, id_cliente, id_vendedor)
VALUES (
  STR_TO_DATE({{ DatePicker1.formattedDate || DatePicker1.selectedDate }}, '%Y-%m-%d'),
  {{ Select_cliente.selectedOptionValue }},
  {{ Select_vendedor.selectedOptionValue }}
);

SELECT LAST_INSERT_ID() AS id_pedido;

SELECT id_produto, nome_produto FROM estoque;

UPDATE estoque
SET quantidade = quantidade - {{ Number(InputQTD.text) }}
WHERE id_produto = {{ Select_produto.selectedOptionValue }};


UPDATE estoque e
JOIN itens_pedido i ON e.id_produto = i.id_produto
SET e.quantidade = e.quantidade + i.quantidade
WHERE i.id_pedido = {{ Select_pedido_delete.selectedOptionValue }};

UPDATE estoque
SET quantidade = quantidade - {{ Number(qtd_edit_venda.text) }}
WHERE id_produto = {{ Select_edit_product_venda.selectedOptionValue }};


-- Atualiza pedido
UPDATE pedido
SET
  data_pedido = STR_TO_DATE('{{ DatePicker_edit_venda.formattedDate || Date_Pedido.selectedDate }}', '%Y-%m-%d'),
  id_cliente = {{ Select_edit_client_venda.selectedOptionValue }},
  id_vendedor = {{ Select_edit_saler_venda.selectedOptionValue }}
WHERE id_pedido = {{ Select_edit_pedido_venda.selectedOptionValue }};

-- Atualiza itens_pedido
UPDATE itens_pedido
SET
  id_produto = {{ Select_edit_product_venda.selectedOptionValue }},
  quantidade = {{ Number(qtd_edit_venda.text) }}
WHERE id_pedido = {{ Select_edit_pedido_venda.selectedOptionValue }};



SELECT 
    ROUND(SUM(i.quantidade * e.preco), 2) AS total_vendas
FROM 
    pedido p
JOIN 
    itens_pedido i ON p.id_pedido = i.id_pedido
JOIN 
    estoque e ON i.id_produto = e.id_produto;



SELECT id, nome FROM Vendedores;    


DELETE FROM pedido
WHERE id_pedido = {{ Select_pedido_delete.selectedOptionValue }};


UPDATE estoque
SET quantidade = quantidade - (
  {{ qtd_edit_venda.text }} - (
    SELECT quantidade FROM itens_pedido WHERE id_pedido = {{ Select_Pedido.selectedOptionValue }}
  )
)
WHERE id_produto = {{ Select_edit_product_venda.selectedOptionValue }};


SELECT *
FROM vw_itens_pedido
ORDER BY data_pedido DESC
LIMIT 10;
