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
            alert("⚠️ As senhas novas não coincidem!");
            newPasswordInput.style.backgroundColor = "#ffcccc";
            confirmPasswordInput.style.backgroundColor = "#ffcccc";
            return;
        }

        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");

        fetch("/usuarios/change_password", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": csrfToken
            },
            body: JSON.stringify({
                current_password: senhaAtual,
                new_password: novaSenha,
                password_confirmation: confirmarSenha
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                alert(`❌ Erro: ${data.error}`);
            } else {
                aviso.textContent = data.message;
                aviso.style.display = "block";
                passwordInput.value = "";
                newPasswordInput.value = "";
                confirmPasswordInput.value = "";
                setTimeout(() => {
                    aviso.style.display = "none";
                }, 3000);
            }
        })
        .catch(error => {
            console.error("Erro ao conectar ao servidor:", error);
            alert("Erro ao conectar ao servidor. Tente novamente.");
        });
    }

    const submitButton = document.querySelector(".btn.btn-second");
    submitButton.addEventListener("click", enviarFormulario);
});
