export default {
 
  myVar1: [],
  myVar2: {},

  
  verificarLogin() {
    if (!appsmith.store.usuarioLogado) {
      navigateTo("Login");
    }
  },


  async fazerLogout() {
    await removeValue("usuarioLogado");
    navigateTo("Login");
  }
}
