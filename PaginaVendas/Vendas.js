export default {
  async carregarHistorico() {
    const dados = await getHistoricoVendas.run();
    storeValue("getHistoricoVendas", dados);
  }
}


export default {
  async atualizarHistorico() {
    try {
      
      const resultado = await getHistoricoVendas.run();
      await storeValue("getHistoricoVendas", resultado);

     
      await storeValue("reload", true);

    
      navigateTo("Vendas", {}, "SAME_WINDOW");

      
      return resultado;
    } catch (error) {
      showAlert("Erro ao atualizar histórico de vendas", "error");
      console.error("Erro no atualizarHistorico:", error);
    }
  }
}
