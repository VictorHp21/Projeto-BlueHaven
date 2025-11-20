SELECT * FROM Clientes;

SELECT IdCliente, Nome FROM Clientes;

DELETE FROM Clientes
  WHERE IdCliente = {{data_table.triggeredRow.IdCliente}};

DELETE FROM Clientes
WHERE IdCliente = {{ Select1.selectedOptionValue }};

INSERT INTO Clientes (
	Nome,
	Endereco,
	CPF)
VALUES (
	'{{insert_form.formData.Nome}}',
	'{{insert_form.formData.Endereco}}',
	'{{insert_form.formData.CPF}}');


INSERT INTO Clientes (Nome, Endereco, CPF)
VALUES (
  '{{Mnome.text}}',
  '{{Mendereco.text}}',
  '{{Mcpf.text}}'
);

SELECT * FROM Clientes
WHERE Nome like '%{{data_table.searchText || ""}}%'
ORDER BY {{data_table.sortOrder.column || 'IdCliente'}} {{data_table.sortOrder.order || "ASC"}}
LIMIT {{data_table.pageSize}}
OFFSET {{(data_table.pageNo - 1) * data_table.pageSize}};


SELECT IdCliente, Nome, Endereco, CPF
FROM (
    SELECT *
    FROM Clientes
    ORDER BY IdCliente DESC
    LIMIT 3
) AS ultimos_tres
ORDER BY RAND();


UPDATE Clientes
SET
  Nome = '{{ Mnome_edit.text }}',
  Endereco = '{{ Mendereco_edit.text }}',
  CPF = '{{ Mcpf_edit.text }}'
WHERE
  IdCliente = {{ Select_edit_client.selectedOptionValue }};


