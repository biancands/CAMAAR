document.addEventListener("DOMContentLoaded", function () {
    const templates = [
      { id: 1, name: "Template 1", semestre: "2023.1"},
      { id: 2, name: "Template 2", semestre: "2022.1"},
      { id: 3, name: "Template 3", semestre: "2024.1"},
      { id: 4, name: "Template 4", semestre: "2021.1"},
      { id: 5, name: "Template 5", semestre: "2020.1"},
      { id: 6, name: "Template 6", semestre: "2023.1"},
      { id: 7, name: "Template 7", semestre: "2022.1"},
    ];
  
    const cardsContainer = document.getElementById("cards-container");
  
    function criarCard(template) {
      const card = document.createElement("div");
      card.className = "card";
  
      card.innerHTML = `
        <div class="row">
          <h3>${template.name}</h3>
        </div>
        <p><strong>Semestre:</strong> ${template.semestre}</p>
      `;
  
      card.addEventListener("click", function () {
        window.location.href = `/templates/${template.id}`;
      });
  
      return card;
    }

    function criarCardAdicao() {
        const card = document.createElement("div");
        card.className = "card add-card";
  
        card.innerHTML = `
          <div class="add">+</div>
        `;
  
        card.addEventListener("click", function () {
          alert("Adicionar novo template"); // Aqui você pode redirecionar ou abrir um modal
        });
  
        return card;
      }

    function renderizarTemplates(lista) {
        cardsContainer.innerHTML = "";
        lista.forEach((avaliacao) => {
            const card = criarCard(avaliacao);
            cardsContainer.appendChild(card);
        });
        const cardAdicao = criarCardAdicao();
        cardsContainer.appendChild(cardAdicao);
    }
    renderizarTemplates(templates);
});