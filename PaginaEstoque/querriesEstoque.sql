SELECT 
  id_produto,
  nome_produto,
  tamanho,
  categoria,
  preco,
  quantidade
FROM produtos
ORDER BY id_produto ASC;

SELECT
  nome_produto,
  categoria,
  valor,
  quantidade,
  criado_em
FROM solicitacoes
ORDER BY criado_em DESC
LIMIT 3;

SELECT *
FROM vw_produtos_info
ORDER BY nome_produto DESC;


INSERT INTO estoque (nome_produto, tamanho, categoria, preco, quantidade) 
VALUES (
  '{{Input_Nome_Produto.text}}',
  '{{Input_Tamanho.text}}',
  '{{Input_Categoria.text}}', 
  {{Input_Preco.text}},
  {{Input_Quantidade.text}}
)

INSERT INTO solicitacoes (nome_produto, categoria, valor, quantidade)
VALUES ('Produto Teste', 'Teste', 10.00, 1);

INSERT INTO estoque (nome_produto, tamanho, categoria, preco, quantidade)
VALUES (
  '{{ nome_produto_insert.text }}',
  '{{ tamanho_insert_produto.selectedOptionValue }}',
  '{{ categoria_insert.selectedOptionValue }}',
  {{ Input_Preco_insert_produto.text }},
  {{ qtd_insert_produto.text }}
);

SELECT  id_produto, nome_produto FROM estoque;

DELETE FROM estoque
WHERE id_produto = {{ Select_produto_delete.selectedOptionValue }};

UPDATE estoque
SET
  nome_produto = '{{ nome_update_produto.text }}',
  tamanho = '{{ tamanho_update_produto.selectedOptionValue }}',
  categoria = '{{ categoria_update.selectedOptionValue }}',
  preco = {{ Input_Preco_update_produto.text }},
  quantidade = {{ qtd_update_produto.text }}
WHERE
  id_produto = {{ select_produto_edit.selectedOptionValue }};

