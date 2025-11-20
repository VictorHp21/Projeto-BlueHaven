appsmith.onReady(() => {
  const container = document.getElementById("lista-fornecedores");
  const logosDiv = document.getElementById("marca-logos");

  const renderFornecedores = () => {
    container.innerHTML = "";
    logosDiv.innerHTML = "";

    // Pega os fornecedores do Default Model
    const todosFornecedores = appsmith.model?.Fornecedores || [];
    if (!todosFornecedores.length) {
      container.innerText = "Nenhum fornecedor encontrado.";
      return;
    }

    // Adiciona logos (em branco e tamanho menor)
const logos = [
  "https://upload.wikimedia.org/wikipedia/commons/a/a6/Logo_NIKE.svg",
  "https://upload.wikimedia.org/wikipedia/commons/2/20/Adidas_Logo.svg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Vans-logo.svg/1187px-Vans-logo.svg.png?20150315211742",
  "https://upload.wikimedia.org/wikipedia/fr/thumb/7/72/Puma.svg/1167px-Puma.svg.png?20240428022211"      
];



    logos.forEach(url => {
      const img = document.createElement("img");
      img.src = url;
      img.alt = "Marca";
      img.className = "marca-logo";
      logosDiv.appendChild(img);
    });

    // Pega apenas os 10 primeiros fornecedores
    const fornecedores = todosFornecedores.slice(0, 10);

    // Cria os cards
    fornecedores.forEach((f) => {
      const card = document.createElement("div");
      card.className = "fornecedor-card";
      card.innerHTML = `
        <div class="fornecedor-info">
          <span>🏢 <b>Nome:</b> ${f.nome}</span>
          <span>🆔 <b>CNPJ:</b> ${f.cnpj}</span>
          <span>📞 <b>Telefone:</b> ${f.telefone}</span>
        </div>
      `;
      container.appendChild(card);
    });
  };

  renderFornecedores();
  if (appsmith.model) appsmith.model.onChange(renderFornecedores);
});
