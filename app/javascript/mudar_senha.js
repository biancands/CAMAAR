document.addEventListener("DOMContentLoaded", function () {
    console.log("JavaScript de Mudança de Senha carregado!");

    function enviarFormulario(event) {
        event.preventDefault(); // Evita o recarregamento da página

        const passwordInput = document.getElementById("password");
        const newPasswordInput = document.getElementById("new-password");
        const confirmPasswordInput = document.getElementById("confirm-password");
        const aviso = document.getElementById("aviso");

        const senhaAtual = passwordInput.value.trim();
        const novaSenha = newPasswordInput.value.trim();
        const confirmarSenha = confirmPasswordInput.value.trim();

        // Resetando estilos e mensagens
        passwordInput.style.backgroundColor = "";
        newPasswordInput.style.backgroundColor = "";
        confirmPasswordInput.style.backgroundColor = "";
        aviso.style.display = "none";

        if (!senhaAtual || !novaSenha || !confirmarSenha) {
            alert("⚠️ Preencha todos os campos!");
            if (!senhaAtual) passwordInput.style.backgroundColor = "#ffcccc";
            if (!novaSenha) newPasswordInput.style.backgroundColor = "#ffcccc";
            if (!confirmarSenha) confirmPasswordInput.style.backgroundColor = "#ffcccc";
            return;
        }

        if (novaSenha !== confirmarSenha) {
            alert("⚠️ As senhas não coincidem!");
            newPasswordInput.style.backgroundColor = "#ffcccc";
            confirmPasswordInput.style.backgroundColor = "#ffcccc";
            return;
        }

        aviso.style.display = "block"; // Mostra o aviso
        setTimeout(() => {
            aviso.style.display = "none"; // Esconde depois de 3s
        }, 3000);

        console.log("✅ Senha alterada com sucesso!");
    }

    const submitButton = document.querySelector(".btn.btn-second");
    submitButton.addEventListener("click", enviarFormulario);
});
