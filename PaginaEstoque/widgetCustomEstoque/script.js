appsmith.onReady(() => {
  const container = document.getElementById("lista-produtos");
  const totalDiv = document.getElementById("total-produtos");

  // Função que renderiza os produtos
  const renderProdutos = () => {
    container.innerHTML = "";

    // Pega todos os produtos do Default Model
    const todosProdutos = appsmith.model?.Estoque || [];

    if (!todosProdutos.length) {
      totalDiv.innerText = "Nenhum produto encontrado.";
      return;
    }

    // Calcula o total de unidades no estoque (todos os produtos)
    const totalQtd = todosProdutos.reduce((sum, p) => sum + Number(p.quantidade || 0), 0);
    totalDiv.innerText = `Total de produtos cadastrados: ${totalQtd}`;

    // Pega apenas os 10 primeiros produtos para exibir
    const produtos = todosProdutos.slice(0, 10);

    // Cria os cards
    produtos.forEach((p) => {
      const card = document.createElement("div");
      card.className = "produto-card";
      card.innerHTML = `
        <div class="produto-info">
          <span>🧾 <b>Produto:</b> ${p.nome_produto}</span>
          <span>📦 <b>Categoria:</b> ${p.categoria}</span>
          <span>📏 <b>Tamanho:</b> ${p.tamanho}</span>
        </div>
        <div class="produto-info">
          <span>💰 <b>Preço:</b> R$ ${parseFloat(p.preco || 0).toFixed(2)}</span>
          <span>🔢 <b>Qtd:</b> ${p.quantidade}</span>
        </div>
      `;
      container.appendChild(card);
    });
  };

  // Render inicial
  renderProdutos();

  // Atualiza sempre que o Default Model mudar (reativo)
  if (appsmith.model) {
    appsmith.model.onChange(renderProdutos);
  }
});
