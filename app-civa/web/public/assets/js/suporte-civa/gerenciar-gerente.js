$('.select2').select2();

let campos = ["name", "surname", "date-birth",
    "nacionalidade", "tipo-doc-1", "tipo-doc-2", "doc-2",
    "tipo-doc-3", "doc-3",
    "doc-1", "pais", "genero",
    "codigopostal", "endereco",
    "numero", "complemento", "bairro",
    "municipio", "estado", "contato1", "email", "locacao"];

let form = $("#form-meus-dados");

$("#salvar").click(function () {

    if (tratar_campos(campos)) {
        $.post("/app-civa/gerente", form.serialize(), (data, status, jqXHR) => {
            console.log("Data: " + data.responseData + ", Status: " + status + ", jqXHR: " + jqXHR);
            if (status === 'success') {
                title = 'Gerente atualizado com sucesso!';
                text = "Cadastro atualizado.";
                swalAlertSuccess(title, text, callback);

            } else {
                title = 'Erro!';
                text = 'Algum erro ocorreu e seus dados n&atilde;o foram enviados.';
                swalAlertError(title, text, callback);
            }
        });
    } else {
        title = 'Campos n&atilde;o preenchidos!';
        text = 'Todos os campos precisam ser preenchidos!';
        swalAlertError(title, text, callback);
    }

});


$("#excluir").click(function () {
    icon = "info"
    title = 'Deseja realmente excluir esse Gerente?';
    text = 'A&ccedil;&atilde;o irrevers&iacute;vel';
    statusInfo = "Gerente deletado",
            textInfo = "Exclus&atilde;o realizada."
    swalAlertDelete(title, text, statusInfo, textInfo);
});

pegarPaises("nacionalidade");