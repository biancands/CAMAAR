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

document.addEventListener("DOMContentLoaded", function () {
  const userTypeSelect = document.querySelector("select");
  const matriculaField = document.querySelector(".matricula-field");

  matriculaField.style.display = "none";

  userTypeSelect.addEventListener("change", function () {
    if (userTypeSelect.value === "2") { 
      matriculaField.style.display = "block";
    } else {
      matriculaField.style.display = "none";
    }
  });
});
