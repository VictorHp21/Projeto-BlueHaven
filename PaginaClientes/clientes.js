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