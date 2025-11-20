-- cadastrar vendedor
INSERT INTO Vendedores (nome, email, senha_hash)
VALUES (
  '{{ Input_Nome.text }}',
  '{{ Input_Email.text }}',
  SHA2('{{ Input_Senha.text }}', 256)
);

-- Login

SELECT * FROM Vendedores
WHERE email = {{ Email.text }}
AND senha_hash = SHA2({{ Senha.text }}, 256);
