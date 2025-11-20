appsmith.onReady(() => {
  const container = document.getElementById("lista-vendas");
  const totalDiv = document.getElementById("total-vendas");

  const renderVendas = () => {
    container.innerHTML = "";

    // pega o array do Default model
    const vendas = appsmith.model?.vendas || [];

    if (!vendas.length) {
      totalDiv.innerText = "Nenhuma venda encontrada.";
      return;
    }

    // Calcula total das vendas
    const total = vendas.reduce((sum, v) => sum + parseFloat(v.valor || 0), 0);
    totalDiv.innerText = `Total dos pedidos: R$ ${total.toFixed(2)}`;

    vendas.forEach((venda) => {
      const card = document.createElement("div");
      card.className = "venda-card";
      card.innerHTML = `
        <div class="venda-info">
          <span>👤 <b>Cliente:</b> ${venda.cliente}</span>
          <span>📦 <b>Produto:</b> ${venda.produto}</span>
          <span>📅 <b>Data:</b> ${new Date(venda.data_pedido + 'T00:00:00').toLocaleDateString("pt-BR")}</span>
        </div>
        <div class="venda-info">
          <span>💰 R$ ${parseFloat(venda.valor || 0).toFixed(2)}</span>
        </div>
      `;
      container.appendChild(card);
    });
  };

  // Render inicial
  renderVendas();

  // Atualiza sempre que o Default model muda
  if (appsmith.model) {
    appsmith.model.onChange(renderVendas);
  }
});
