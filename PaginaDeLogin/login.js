export default {
  myVar1: [],
  myVar2: {},

  
  verificarLogin() {
    if (!appsmith.store.usuarioLogado) {
      navigateTo("Login");
    }
  },

 
  async fazerLogin() {
    const email = Email.text;
    const senha = Senha.text;

    if (!email || !senha) {
      showAlert("Preencha todos os campos!", "warning");
      return;
    }

    try {
      await LoginQuery.run();
      if (LoginQuery.data.length > 0) {
        await storeValue("usuarioLogado", LoginQuery.data[0]);
        showAlert("Login realizado com sucesso!", "success");
        navigateTo("TelaPrincipal");
      } else {
        showAlert("Email ou senha incorretos!", "error");
      }
    } catch (error) {
      showAlert("Erro ao tentar login: " + error.message, "error");
    }
  },

 
  async fazerLogout() {
    await removeValue("usuarioLogado");
    navigateTo("Login");
  }
}


//limpar inputs

export default {
  limparInputsCadastro() {
   
    const nome = Input_Nome.text;
    const email = Input_Email.text;
    const senha = Input_Senha.text;

    if (!nome || !email || !senha) {
      showAlert("Preencha todos os campos antes de limpar!", "warning");
      return;
    }

    
     Input_Nome.setValue("");
    Input_Email.setValue("");
    Input_Senha.setValue("");

   
  }
}
