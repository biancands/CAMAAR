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
