document.addEventListener("DOMContentLoaded", function () {
  const avaliacoes = [
    { id: 1, materia: "Matemática", semestre: "2023.1", professor: "João Silva" },
    { id: 2, materia: "Português", semestre: "2023.1", professor: "Maria Oliveira" },
    { id: 3, materia: "História", semestre: "2023.1", professor: "Carlos Souza" },
    { id: 4, materia: "Geografia", semestre: "2023.1", professor: "Ana Costa" },
    { id: 5, materia: "Física", semestre: "2023.1", professor: "Pedro Santos" },
    { id: 6, materia: "Química", semestre: "2023.1", professor: "Luiza Fernandes" },
    { id: 7, materia: "Biologia", semestre: "2023.1", professor: "Fernando Lima" },
  ];

  const cardsContainer = document.getElementById("cards-container");

  function criarCard(avaliacao) {
    const card = document.createElement("div");
    card.className = "card";

    card.innerHTML = `
      <div class="card-header">
        <h3>${avaliacao.materia}</h3>
      </div>
      <p><strong>Semestre:</strong> ${avaliacao.semestre}</p>
      <p><strong>Professor:</strong> ${avaliacao.professor}</p>
    `;

    card.addEventListener("click", function () {
      window.location.href = `/formularios/${avaliacao.id}`;
    });

    return card;
  }

  function renderizarAvaliacoes(lista) {
    cardsContainer.innerHTML = "";
    lista.forEach((avaliacao) => {
      const card = criarCard(avaliacao);
      cardsContainer.appendChild(card);
    });
  }

  renderizarAvaliacoes(avaliacoes);

  window.filtrarAvaliacoes = function () {
    const termoBusca = document.getElementById("search-bar").value.toLowerCase();

    const resultadosFiltrados = avaliacoes.filter((avaliacao) =>
      avaliacao.materia.toLowerCase().includes(termoBusca)
    );

    renderizarAvaliacoes(resultadosFiltrados);
  };
});