// Definição dos Estados da Tela
document.addEventListener("DOMContentLoaded", function () {
    var btnSignin = document.querySelector("#signin");
    var btnSignup = document.querySelector("#signup");
    var body = document.querySelector("body");

    btnSignin.addEventListener("click", function () {
        body.className = "sign-in-js";
    });

    btnSignup.addEventListener("click", function () {
        body.className = "sign-up-js";
    });

    // Formulário de Cadastro de Usuário
    const signupForm = document.querySelector(".form.signup");

    signupForm.addEventListener("submit", function (event) {
        event.preventDefault(); // Evita recarregar a página

        const emailInput = document.getElementById("email");
        const TokenInput = document.getElementById("token");
        const PasswordInput = document.getElementById("password");
        const confirmPasswordInput = document.getElementById("confirm-password");
        const errorMessage = document.querySelector(".erro.signup");

        errorMessage.style.display = "none";

        if (!emailInput.value || !PasswordInput.value || !confirmPasswordInput.value || !TokenInput.value) {
            errorMessage.textContent = "Preencha todos os campos!";
            errorMessage.style.display = "block";
            return;
        }

        console.log("Cadastro realizado:", {
            email: emailInput.value,
            senha: PasswordInput.value
        });

        window.location.href = "/avaliacao";
        errorMessage.style.display = "none";
    });

    // Formulário de Login
    const loginForm = document.querySelector(".form.login");

    loginForm.addEventListener("submit", function (event) {
        event.preventDefault();

        const emailInput = loginForm.querySelector("input[type='email']");
        const passwordInput = loginForm.querySelector("input[type='password']");
        const errorMessage = loginForm.querySelector(".erro.login");

        errorMessage.style.display = "none";

        if (!emailInput.value || !passwordInput.value) {
            errorMessage.textContent = "Preencha todos os campos!";
            errorMessage.style.display = "block";
            return;
        }

        console.log("Login realizado:", {
            email: emailInput.value,
            senha: passwordInput.value
        });

        window.location.href = "/avaliacao";
        errorMessage.style.display = "none";
    });
});
