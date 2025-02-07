document.addEventListener("DOMContentLoaded", function () {
    var btnSignin = document.querySelector("#signin");
    var btnSignup = document.querySelector("#signup");
    var body = document.querySelector("body");

    if (btnSignin && btnSignup) {
        btnSignin.addEventListener("click", function () {
            body.className = "sign-in-js";
        });

        btnSignup.addEventListener("click", function () {
            body.className = "sign-up-js";
        });
    }

    // Formulário de Cadastro de Usuário
    const signupForm = document.querySelector(".form.signup");

    if (signupForm) {
        signupForm.addEventListener("submit", function (event) {
            event.preventDefault();

            const email = document.getElementById("email").value;
            const token = document.getElementById("token").value;
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirm-password").value;
            const errorMessage = document.querySelector(".erro.signup");

            errorMessage.style.display = "none";

            if (!email || !token || !password || !confirmPassword) {
                errorMessage.textContent = "Preencha todos os campos!";
                errorMessage.style.display = "block";
                return;
            }

            // Obtém o token CSRF da meta tag
            const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            fetch("/usuarios/activate", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-Token": csrfToken 
                },
                body: JSON.stringify({
                    email: email,
                    token: token,
                    password: password,
                    password_confirmation: confirmPassword
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    errorMessage.textContent = data.error;
                    errorMessage.style.display = "block";
                } else {
                    alert("Senha definida com sucesso! Agora você pode fazer login.");
                    body.className = "sign-in-js"; // Alterna para a tela de login automaticamente
                }
            })
            .catch(error => {
                console.error("Erro ao conectar ao servidor:", error);
                errorMessage.textContent = "Erro ao conectar ao servidor. Tente novamente mais tarde.";
                errorMessage.style.display = "block";
            });
        });
    }

    // Formulário de Login
    const loginForm = document.querySelector(".form.login");

    if (loginForm) {
        loginForm.addEventListener("submit", function (event) {
            event.preventDefault();

            const emailInput = loginForm.querySelector("input[type='email']").value;
            const passwordInput = loginForm.querySelector("input[type='password']").value;
            const errorMessage = loginForm.querySelector(".erro.login");

            errorMessage.style.display = "none";

            if (!emailInput || !passwordInput) {
                errorMessage.textContent = "Preencha todos os campos!";
                errorMessage.style.display = "block";
                return;
            }

            // Obtém o token CSRF da meta tag
            const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            fetch("/usuarios/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-Token": csrfToken
                },
                body: JSON.stringify({
                    email: emailInput,
                    password: passwordInput
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    errorMessage.textContent = data.error;
                    errorMessage.style.display = "block";
                } else {
                    alert("Login bem-sucedido!");
                    window.location.href = "/avaliacoes"; // Redireciona para a página de avaliações
                }
            })
            .catch(error => {
                console.error("Erro ao conectar ao servidor:", error);
                errorMessage.textContent = "Erro ao conectar ao servidor. Tente novamente mais tarde.";
                errorMessage.style.display = "block";
            });
        });
    }
});
