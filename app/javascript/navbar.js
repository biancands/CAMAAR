document.addEventListener("DOMContentLoaded", function () {
  class ButtonNavbar {
    constructor(button, navList, navLinks) {
      this.button = document.querySelector(button);
      this.navList = document.querySelector(navList);
      this.navLinks = document.querySelectorAll(navLinks);
      this.activeClass = "active";

      this.handleClick = this.handleClick.bind(this);
    }

    animateLinks() {
      this.navLinks.forEach((link, index) => {
        link.style.animation
          ? (link.style.animation = "")
          : (link.style.animation = `navLinkFade 0.5s ease forwards ${
              index / 7 + 0.3
            }s`);
      });
    }

    handleClick() {
      console.log("Botão clicado!"); // Debugging
      this.navList.classList.toggle(this.activeClass);
      this.button.classList.toggle(this.activeClass);
      this.animateLinks();
    }

    addClickEvent() {
      this.button.addEventListener("click", this.handleClick);
    }

    init() {
      if (this.button) {
        this.addClickEvent();
      }
      return this;
    }
  }

  const navbarInstance = new ButtonNavbar(
    ".icon-menu",
    ".nav-list",
    ".nav-list li"
  );

  navbarInstance.init();
});

document.addEventListener("DOMContentLoaded", function () {
  const navLinks = document.querySelectorAll(".nav-list a");

  navLinks.forEach((link) => {
    link.addEventListener("click", function (event) {
      event.preventDefault(); 
      const href = this.getAttribute("href");
      window.location.href = href;
    });
  });
});

document.addEventListener("DOMContentLoaded", function () {
  const logoutButton = document.getElementById("logout-button");

  if (logoutButton) {
    logoutButton.addEventListener("click", function (event) {
      event.preventDefault();
      window.location.href = "/login";
    });
  }
});