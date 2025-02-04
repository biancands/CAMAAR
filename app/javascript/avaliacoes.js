document.addEventListener("DOMContentLoaded", function () {
  console.log("✅ JavaScript de Avaliações carregado!");
  
  let filtrarAvaliacoes = () => {
      const termoBusca = document.getElementById("search-bar").value.toLowerCase();
      const cards = document.querySelectorAll("#cards-container .card");

      console.log("ALguma coisa",cards)

      cards.forEach((card) => {
          const materia = card.getAttribute("data-materia");
          if (materia.includes(termoBusca)) {
              card.style.display = "block";
          } else {
              card.style.display = "none";
          }
      });
  }
  document.querySelectorAll(".card").forEach((card) => {
      card.addEventListener("click", function () {
          const id = card.getAttribute("data-id"); // Pega o ID do card
          window.location.href = `/forms/${id}`; // Redireciona para /forms/id
      });
  });
  console.log('Aqui chega sem ter que reniciar o códgio')

  window.filtrarAvaliacoes = filtrarAvaliacoes;
});