DELETE FROM fornecedores
WHERE id_fornecedor = {{ Select_fornecedores_excl.selectedOptionValue }};


SELECT * FROM vw_fornecedores;


SELECT id_fornecedor, Nome FROM fornecedores;

DELETE FROM fornecedores
WHERE id_fornecedor = {{ this.params.id_fornecedor }};

INSERT INTO fornecedores (nome, telefone, cnpj)
VALUES ('{{ this.params.nome }}', '{{ this.params.telefone }}', '{{ this.params.cnpj }}');


SELECT *
FROM fornecedores
WHERE
  {{ Input_Buscar_Fornecedores.text.trim() !== "" 
      ? "LOWER(nome) LIKE LOWER(CONCAT('%', '" + Input_Buscar_Fornecedores.text + "', '%'))"
      : "1=1"
  }}
ORDER BY id_fornecedor DESC;


UPDATE fornecedores
SET
  nome = '{{ Input_Ed_nome.text }}',
  telefone = '{{ Input_Ed_telefone.text }}',
  cnpj = '{{ Input_Ed_cnpj.text }}'
WHERE id_fornecedor = {{ appsmith.store.editingFornecedor.id_fornecedor }};


UPDATE fornecedores
SET
  nome = '{{ Mnome__editforn.text }}',
  cnpj = '{{ Mcnpj_edit_forn.text }}',
  telefone = '{{ Mtelefone_forn_edit.text }}'
WHERE
  id_fornecedor = {{ Select_edit_forn.selectedOptionValue }};
