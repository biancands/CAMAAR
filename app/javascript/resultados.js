document.addEventListener("DOMContentLoaded", function () {
  window.filtrarAvaliacoes = function () {
      const termoBusca = document.getElementById("search-bar").value.toLowerCase();
      const cards = document.querySelectorAll(".card");

      cards.forEach(card => {
          const materia = card.dataset.materia;
          if (materia.includes(termoBusca)) {
              card.style.display = "block"; 
          } else {
              card.style.display = "none"; 
          }
      });
  };

  document.querySelectorAll(".card").forEach(icon => {
    icon.addEventListener("click", function () {
      const turmaId = this.getAttribute("data-id");
      if (turmaId) {
        window.location.href = `/resultados/${turmaId}/download_csv`;
      }
    });
  });
});
