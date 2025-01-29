// Definição dos Estados da Tela
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
document.addEventListener("DOMContentLoaded", function () {
  const users = [
      { email: "aluno@aluno.unb.br" },
      { email: "professor@unb.br" }
  ];

  const signupForm = document.querySelector(".form.signup");
  const nameInput = signupForm.querySelector("input[type='text']");
  const emailInput = signupForm.querySelector("input[type='email']");
  const userTypeSelect = signupForm.querySelector("select");
  const matriculaInput = signupForm.querySelector(".matricula-field input");
  const passwordInput = signupForm.querySelector("input[type='password']");
  const signupButton = signupForm.querySelector(".btn.btn-second");
  const errorMessage = document.querySelector(".erro.signup"); 

  errorMessage.style.display = "none";
  document.querySelector(".matricula-field").style.display = "none"; 

  userTypeSelect.addEventListener("change", function () {
      if (userTypeSelect.value === "2") { // Se for "Discente"
          document.querySelector(".matricula-field").style.display = "block";
      } else {
          document.querySelector(".matricula-field").style.display = "none";
      }
  });

  signupButton.addEventListener("click", function (event) {
      event.preventDefault(); 

      const name = nameInput.value.trim();
      const email = emailInput.value.trim();
      const userType = userTypeSelect.value;
      const matricula = matriculaInput.value.trim();
      const password = passwordInput.value.trim();
      let emailExists = false;

      nameInput.style.backgroundColor = "";
      emailInput.style.backgroundColor = "";
      userTypeSelect.style.backgroundColor = "";
      matriculaInput.style.backgroundColor = "";
      passwordInput.style.backgroundColor = "";
      errorMessage.style.display = "none"; 

      // Verificação se os campos obrigatórios estão vazios
      if (!name || !email || userType === "0" || !password || (userType === "2" && !matricula)) {
          errorMessage.textContent = "Preencha todos os campos obrigatórios!";
          errorMessage.style.display = "block";

          if (!name) nameInput.style.backgroundColor = "#ffcccc";
          if (!email) emailInput.style.backgroundColor = "#ffcccc";
          if (userType === "0") userTypeSelect.style.backgroundColor = "#ffcccc";
          if (!password) passwordInput.style.backgroundColor = "#ffcccc";
          if (userType === "2" && !matricula) matriculaInput.style.backgroundColor = "#ffcccc";

          return;
      }

      users.forEach(user => {
          if (user.email === email) {
              emailExists = true;
          }
      });

      if (emailExists) {
          errorMessage.textContent = "E-mail já cadastrado!";
          errorMessage.style.display = "block";
          emailInput.style.backgroundColor = "#ffcccc";
          return;
      }

      console.log("nome:", name,"email:", email,"tipo:", userType,"matricula:", matricula,"senha:", password);

      errorMessage.style.display = "none"; 
  });
});


// Formulário de Login
document.addEventListener("DOMContentLoaded", function () {
  const users = [
      { email: "aluno@aluno.unb.br", password: "123456" },
      { email: "professor@unb.br", password: "senha123" }
  ];

  const loginForm = document.querySelector(".form.login");
  const emailInput = loginForm.querySelector("input[type='email']");
  const passwordInput = loginForm.querySelector("input[type='password']");
  const loginButton = loginForm.querySelector(".btn.btn-second");
  const errorMessage = loginForm.querySelector(".erro.login"); 

  errorMessage.style.display = "none";

  loginButton.addEventListener("click", function (event) {
      event.preventDefault(); 

      const email = emailInput.value.trim();
      const password = passwordInput.value.trim();
      let userFound = false;
      let passwordCorrect = false;

      emailInput.style.backgroundColor = "";
      passwordInput.style.backgroundColor = "";
      errorMessage.style.display = "none"; 

      if (!email || !password) {
          errorMessage.textContent = "Preencha todos os campos!";
          errorMessage.style.display = "block"; 
          if (!email) emailInput.style.backgroundColor = "#ffcccc"; 
          if (!password) passwordInput.style.backgroundColor = "#ffcccc";
          return;
      }

      users.forEach(user => {
          if (user.email === email) {
              userFound = true;
              if (user.password === password) {
                  passwordCorrect = true;
              }
          }
      });

      if (!userFound) {
          errorMessage.textContent = "Usuário não encontrado!";
          errorMessage.style.display = "block";
          emailInput.style.backgroundColor = "#ffcccc";
          return;
      }

      if (!passwordCorrect) {
          errorMessage.textContent = "Senha incorreta!";
          errorMessage.style.display = "block";
          passwordInput.style.backgroundColor = "#ffcccc";
          return;
      }

      console.log("emial:", email,"senha:", password);
      errorMessage.style.display = "none"; // Esconde a mensagem de erro caso tenha sido exibida
  });
});

// Formulário de Mudança de Senha

document.addEventListener("DOMContentLoaded", function () {
  
  const users = [
      { email: "aluno@aluno.unb.br" },
      { email: "professor@unb.br" }
  ];

  const forgetForm = document.querySelector(".form.forgets");
  const emailInput = document.getElementById("email");
  const newPasswordInput = document.getElementById("new-password");
  const confirmPasswordInput = document.getElementById("confirm-password");
  const forgetButton = forgetForm.querySelector(".btn.btn-second");
  const errorMessage = document.querySelector(".erro.forgets"); 

  errorMessage.style.display = "none";

  forgetButton.addEventListener("click", function (event) {
      event.preventDefault();
      const email = emailInput.value.trim();
      const newPassword = newPasswordInput.value.trim();
      const confirmPassword = confirmPasswordInput.value.trim();
      let emailExists = false;

      emailInput.style.backgroundColor = "";
      newPasswordInput.style.backgroundColor = "";
      confirmPasswordInput.style.backgroundColor = "";
      errorMessage.style.display = "none"; 

      if (!email || !newPassword || !confirmPassword) {
          errorMessage.textContent = "Preencha todos os campos!";
          errorMessage.style.display = "block";

          if (!email) emailInput.style.backgroundColor = "#ffcccc";
          if (!newPassword) newPasswordInput.style.backgroundColor = "#ffcccc";
          if (!confirmPassword) confirmPasswordInput.style.backgroundColor = "#ffcccc";

          return;
      }

      users.forEach(user => {
          if (user.email === email) {
              emailExists = true;
          }
      });

      if (!emailExists) {
          errorMessage.textContent = "E-mail não encontrado!";
          errorMessage.style.display = "block";
          emailInput.style.backgroundColor = "#ffcccc";
          return;
      }

      if (newPassword !== confirmPassword) {
          errorMessage.textContent = "As senhas não coincidem!";
          errorMessage.style.display = "block";
          newPasswordInput.style.backgroundColor = "#ffcccc";
          confirmPasswordInput.style.backgroundColor = "#ffcccc";
          return;
      }

      console.log("Email:", email,"Nova Senha", newPassword);
      errorMessage.style.display = "none"; 
  });
});
