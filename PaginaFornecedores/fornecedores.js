export default {
  deletarFornecedor: async (id_fornecedor) => {
    try {
      await deleteFornecedor.run({ id: id_fornecedor });
      await selectFornecedores.run(); // atualiza a lista na tela
      showAlert("Fornecedor excluído com sucesso!", "success");
    } catch (error) {
      showAlert("Erro ao excluir fornecedor: " + error.message, "error");
    }
  }
};


export default {
  abrirModalEdicao: (fornecedor) => {
    storeValue('editingFornecedor', fornecedor)
      .then(() => showModal('Modal_Editar_Fornecedor'));
  }
}



export default {
  async cadastrarFornecedor() {
    try {
      await insertFornecedor.run({
        nome: input_nome_fornecedor.text,
        cnpj: input_cnpj_fornecedor.text,
        telefone: input_telefone_fornecedor.text
      });

      await selectFornecedores.run();
      closeModal('Modal1');
      resetWidget('Modal1', true);
      showAlert('Fornecedor adicionado com sucesso!', 'success');
    } catch (error) {
      showAlert('Erro ao adicionar fornecedor', 'error');
      console.error(error);
    }
  }
}

export default {
  // 🟩 1. Abrir modal de edição
  abrirModalEdicao(item) {
    storeValue("editingFornecedor", item);
    showModal("Modal_Editar_Fornecedor");
  },

  // 🟦 2. Cadastrar novo fornecedor
  async cadastrarFornecedor() {
    try {
      await insertFornecedor.run({
        nome: input_nome_fornecedor.text,
        telefone: input_telefone_fornecedor.text,
        cnpj: input_cnpj_fornecedor.text,
      });

      await selectFornecedores.run();
      closeModal("Modal1");
      resetWidget("Modal1", true);
      showAlert("Fornecedor adicionado com sucesso!", "success");
    } catch (error) {
      showAlert("Erro ao adicionar fornecedor: " + error.message, "error");
      console.error(error);
    }
  },

  // 🟨 3. Atualizar fornecedor existente
  async atualizarFornecedor() {
    const fornecedor = appsmith.store.editingFornecedor;

    if (!fornecedor || !fornecedor.id_fornecedor) {
      showAlert("Nenhum fornecedor selecionado para edição.", "error");
      return;
    }

    try {
      await updateFornecedor.run({
        id_fornecedor: fornecedor.id_fornecedor,
        nome: Input_Ed_nome.text,
        telefone: Input_Ed_telefone.text,
        cnpj: Input_Ed_cnpj.text,
      });

      await selectFornecedores.run();
      closeModal("Modal_Editar_Fornecedor");
      showAlert("Fornecedor atualizado com sucesso!", "success");
    } catch (error) {
      showAlert("Erro ao atualizar fornecedor: " + error.message, "error");
      console.error(error);
    }
  },

  // 🟥 4. Excluir fornecedor
  async excluirFornecedor(id) {
    try {
      await deleteFornecedor.run({ id_fornecedor: id });
      await selectFornecedores.run();
      showAlert("Fornecedor excluído com sucesso!", "success");
    } catch (error) {
      showAlert("Erro ao excluir fornecedor: " + error.message, "error");
      console.error(error);
    }
  },
};


export default {
  async carregar_fornecedores() {
    try {
      const dados = await Fornecedores_view.run();
      await storeValue("Fornecedores_view", dados); // salva no store
			
			await storeValue("reload", true);

    
      navigateTo("Fornecedores", {}, "SAME_WINDOW");
			
			
      return dados;
    } catch (e) {
      showAlert("Erro ao carregar fornecedores", "error");
      console.error(e);
    }
  }
}
