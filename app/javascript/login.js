// Definição dos Estados da Tela
document.addEventListener("DOMContentLoaded", function () {
    var btnSignin = document.querySelector("#signin");
    var btnSignup = document.querySelector("#signup");
    var forgotPasswordLink = document.querySelector("#forgetspassword");
    var body = document.querySelector("body");

    btnSignin.addEventListener("click", function () {
        body.className = "sign-in-js";
    });

    btnSignup.addEventListener("click", function () {
        body.className = "sign-up-js";
    });

    forgotPasswordLink.addEventListener("click", function () {
        body.className = "reset-password-js";
    });

    // Formulário de Cadastro de Usuário
    const signupForm = document.querySelector(".form.signup");

    signupForm.addEventListener("submit", function (event) {
        event.preventDefault(); // Evita recarregar a página

        const nameInput = signupForm.querySelector("input[type='text']");
        const emailInput = signupForm.querySelector("input[type='email']");
        const userTypeSelect = signupForm.querySelector("select");
        const matriculaInput = signupForm.querySelector(".matricula-field input");
        const passwordInput = signupForm.querySelector("input[type='password']");
        const errorMessage = document.querySelector(".erro.signup");

        errorMessage.style.display = "none";

        if (!nameInput.value || !emailInput.value || userTypeSelect.value === "0" || !passwordInput.value || (userTypeSelect.value === "2" && !matriculaInput.value)) {
            errorMessage.textContent = "Preencha todos os campos!";
            errorMessage.style.display = "block";
            return;
        }

        console.log("Cadastro realizado:", {
            nome: nameInput.value,
            email: emailInput.value,
            tipo: userTypeSelect.value,
            matricula: matriculaInput.value,
            senha: passwordInput.value
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

    // Formulário de Mudança de Senha
    const forgetForm = document.querySelector(".form.forgets");

    forgetForm.addEventListener("submit", function (event) {
        event.preventDefault();

        const emailInput = document.getElementById("email");
        const newPasswordInput = document.getElementById("new-password");
        const confirmPasswordInput = document.getElementById("confirm-password");
        const errorMessage = document.querySelector(".erro.forgets");

        errorMessage.style.display = "none";

        if (!emailInput.value || !newPasswordInput.value || !confirmPasswordInput.value) {
            errorMessage.textContent = "Preencha todos os campos!";
            errorMessage.style.display = "block";
            return;
        }

        if (newPasswordInput.value !== confirmPasswordInput.value) {
            errorMessage.textContent = "As senhas não coincidem!";
            errorMessage.style.display = "block";
            return;
        }

        console.log("Senha alterada para:", newPasswordInput.value);

        window.location.href = "/avaliacao";
        errorMessage.style.display = "none";
    });
});
