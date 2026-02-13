export default {
	Button4onClick () {
		{{ 
    Insert_ClienteModal.run(); 
    resetWidget("Modal1", true);
    closeModal("Modal1");
}}


	}
}

export default {
	Button6onClick () {
		{{ Delete_ClienteEscolhido.data.run(() => {
     Clientes_PorNome.data.run();
     resetWidget("Select1");
}); }}

	}
}


// correção delete clientes:

{{
  Delete_ClienteEscolhido.run()
    .then(() => {
      Clientes_PorNome.run();   
      resetWidget("Select1");   
      closeModal("Modal2");     
      showAlert("Cliente excluído com sucesso!", "success");
    })
    .catch((error) => {
 
      if (error.message.includes("foreign key constraint fails")) {
        showAlert("Erro: O cliente não pode ser excluído pois existe um pedido ligado a ele.", "error");
      } else {
 
        showAlert("Erro ao excluir cliente: " + error.message, "error");
      }
    });
}}
