export default {
  AdicionarProduto: () => {
    storeValue('EditMode', false);
    showModal('Modal_AdicionarProduto');
  }
}

export default {
  salvarProduto: () => {
    if (!Input_Nome_Produto.text || !Input_Preco.text || !Input_Quantidade.text) {
      showAlert('⚠️ Preencha os campos obrigatórios.', 'warning');
    } else {
      Insert_Produto.run(
        () => {
          showAlert('✅ Produto adicionado com sucesso!', 'success');
          closeModal('Modal_AdicionarProduto');
          Input_Nome_Produto.setValue("");
          Input_Tamanho.setValue("");
          Input_Categoria.setValue("");
          Input_Preco.setValue("");
          Input_Quantidade.setValue("");
          Get_Produtos.run(); // atualiza a tabela
        },
        (err) => showAlert('❌ Erro ao adicionar: ' + err.message, 'error')
      );
    }
  }
};

export default {
  confirmarProduto: async () => {
    try {
      // 1️⃣ Executa a query de inserção
      await Insert_Produto.run();

      // 2️⃣ Atualiza a tabela
      await Get_Produtos.run();

      // 3️⃣ Limpa os campos
      Input_Nome_Produto.setValue("");
      Input_Tamanho.setValue("");
      Input_Categoria.setValue("");
      Input_Preco.setValue("");
      Input_Quantidade.setValue("");

      // 4️⃣ Fecha o modal
     closeModal("Modal_AdicionarProduto");


      // 5️⃣ Mostra alerta de sucesso
      showAlert("Produto adicionado com sucesso!", "success");
    } catch (error) {
      showAlert("Erro ao adicionar produto: " + error.message, "error");
    }
  }
}

export default {
  deletarProduto: async () => {
    try {
      // executa a query de delete
      const res = await Delete_Produto.run();

      // atualiza a tabela
      await Get_Produtos.run();

      // mostra alerta
      showAlert("Produto deletado com sucesso!", "success");

      // retorna algo pra não gerar o erro "did not return any data"
      return res;
    } catch (err) {
      showAlert("Erro ao deletar o produto: " + err.message, "error");
      return err;
    }
  }
}


export default {
  async carregar_estoque() {
    try {
      const dados = await Get_view_produtos.run();
      await storeValue("Get_view_produtos", dados);
			
			
			 await storeValue("reload", true);

    
      navigateTo("Estoque", {}, "SAME_WINDOW");
			
      return dados;
    } catch (e) {
      showAlert("Erro ao carregar estoque", "error");
      console.error(e);
    }
  }
}
