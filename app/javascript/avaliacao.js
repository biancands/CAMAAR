document.addEventListener("DOMContentLoaded", function () {
  const avaliacoes = [
    { materia: "Matemática", semestre: "2023.1", professor: "João Silva" },
    { materia: "Português", semestre: "2023.1", professor: "Maria Oliveira" },
    { materia: "História", semestre: "2023.1", professor: "Carlos Souza" },
    { materia: "Geografia", semestre: "2023.1", professor: "Ana Costa" },
    { materia: "Física", semestre: "2023.1", professor: "Pedro Santos" },
    { materia: "Química", semestre: "2023.1", professor: "Luiza Fernandes" },
    { materia: "Biologia", semestre: "2023.1", professor: "Fernando Lima" },
  ];

  const cardsContainer = document.getElementById("cards-container");

  function criarCard(avaliacao) {
    const card = document.createElement("div");
    card.className = "card";

    card.innerHTML = `
      <h3>${avaliacao.materia}</h3>
      <p><strong>Semestre:</strong> ${avaliacao.semestre}</p>
      <p><strong>Professor:</strong> ${avaliacao.professor}</p>
    `;

    return card;
  }

  function renderizarAvaliacoes(lista) {
    cardsContainer.innerHTML = ""; // Limpa os cards antes de renderizar
    lista.forEach((avaliacao) => {
      const card = criarCard(avaliacao);
      cardsContainer.appendChild(card);
    });
  }

  // Renderiza os cards inicialmente
  renderizarAvaliacoes(avaliacoes);

  // Função de filtragem
  window.filtrarAvaliacoes = function () {
    const termoBusca = document.getElementById("search-bar").value.toLowerCase();

    const resultadosFiltrados = avaliacoes.filter((avaliacao) =>
      avaliacao.materia.toLowerCase().includes(termoBusca)
    );

    renderizarAvaliacoes(resultadosFiltrados);
  };
});
