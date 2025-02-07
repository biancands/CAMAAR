document.addEventListener("DOMContentLoaded", function () {
    const templates = [
      { id: 1, name: "Template 1", semestre: "2023.1" },
      { id: 2, name: "Template 2", semestre: "2022.1" },
      { id: 3, name: "Template 3", semestre: "2024.1" },
      { id: 4, name: "Template 4", semestre: "2021.1" },
      { id: 5, name: "Template 5", semestre: "2020.1" },
      { id: 6, name: "Template 6", semestre: "2023.1" },
      { id: 7, name: "Template 7", semestre: "2022.1" },
    ];
  
    const cardsContainer = document.getElementById("cards-container");
    const modal = document.getElementById("modal");
    const closeModalBtn = document.getElementById("close-modal");
    const form = document.getElementById("form-template");
    const questionsContainer = document.getElementById("questions-container");
    const addQuestionBtn = document.getElementById("add-question");
  
    let questionCount = 0;
  
    function toggleOptionsVisibility(questionDiv) {
        const select = questionDiv.querySelector(".question-type");
        const optionsContainer = questionDiv.querySelector(".options-container");
        
        if (select.value === "radio") {
            optionsContainer.style.display = "block";
        } else {
            optionsContainer.style.display = "none";
        }
    }
  
    function addOption(inputContainer) {
        const newOption = document.createElement("input");
        newOption.type = "text";
        newOption.className = "question-options";
        newOption.placeholder = "Nova opção";
        inputContainer.appendChild(newOption);
    }
  
    function createQuestionElement() {
        questionCount++;
        const questionDiv = document.createElement("div");
        questionDiv.className = "question";
        
        questionDiv.innerHTML = `
            <div class="space-between">
                <h3>Questão ${questionCount}</h3>
                <button type="button" class="remove-question">×</button>
            </div>
            <label>Tipo:</label>
            <select class="question-type">
                <option value="radio">Radio</option>
                <option value="texto">Texto</option>
            </select>
            <div>
            <label>Texto:</label>
            </div>
            <input type="text" class="question-text" placeholder="Placeholder" required>
            <div class="options-container">
                <label>Opções:</label>
                <div class="options-inputs">
                    <input type="text" class="question-options" placeholder="Placeholder">
                </div>
                <button type="button" class="add-option">+</button>
            </div>
        `;
        
        const select = questionDiv.querySelector(".question-type");
        const addOptionBtn = questionDiv.querySelector(".add-option");
        const optionsInputContainer = questionDiv.querySelector(".options-inputs");
        const removeQuestionBtn = questionDiv.querySelector(".remove-question");
  
        select.addEventListener("change", () => toggleOptionsVisibility(questionDiv));
        addOptionBtn.addEventListener("click", () => addOption(optionsInputContainer));
        removeQuestionBtn.addEventListener("click", () => {
            questionDiv.remove();
            questionCount--;
        });
  
        toggleOptionsVisibility(questionDiv);
        return questionDiv;
    }
  
    addQuestionBtn.addEventListener("click", function () {
        const questionDiv = createQuestionElement();
        questionsContainer.appendChild(questionDiv);
    });
  
    function criarCard(template) {
        const card = document.createElement("div");
        card.className = "card";
    
        card.innerHTML = `
          <div class="space-between">
            <h3>${template.name}</h3>
            <button type="button" class="remove-template">×</button>
          </div>
          <p><strong>Semestre:</strong> ${template.semestre}</p>
        `;
    
        card.querySelector(".remove-template").addEventListener("click", function () {
            const index = templates.findIndex(t => t.id === template.id);
            if (index !== -1) {
                templates.splice(index, 1);
                renderizarTemplates(templates);
            }
        });
    
        return card;
    }
    
    function criarCardAdicao() {
        const card = document.createElement("div");
        card.className = "card add-card";
    
        card.innerHTML = `<div class="add">+</div>`;
    
        card.addEventListener("click", function () {
            modal.style.display = "flex";
            questionsContainer.innerHTML = "";
            questionCount = 0;
            questionsContainer.appendChild(createQuestionElement());
        });
    
        return card;
    }
    
    function renderizarTemplates(lista) {
        cardsContainer.innerHTML = "";
        lista.forEach((avaliacoes) => {
            const card = criarCard(avaliacoes);
            cardsContainer.appendChild(card);
        });
        const cardAdicao = criarCardAdicao();
        cardsContainer.appendChild(cardAdicao);
    }
    
    closeModalBtn.addEventListener("click", function () {
        modal.style.display = "none";
    });
  
    form.addEventListener("submit", function (event) {
        event.preventDefault();
    
        const templateName = document.getElementById("template-name").value;
        const questions = [];
    
        document.querySelectorAll(".question").forEach((question) => {
            const type = question.querySelector(".question-type").value;
            const text = question.querySelector(".question-text").value;
            const options = Array.from(question.querySelectorAll(".question-options"))
                .map(input => input.value)
                .filter(value => value.trim() !== "");
    
            questions.push({ type, text, options });
        });
    
        const newTemplate = { id: templates.length + 1, name: templateName, semestre: "Novo" };
        templates.push(newTemplate);
        renderizarTemplates(templates);
    
        modal.style.display = "none";
        form.reset();
        questionsContainer.innerHTML = "";
        questionCount = 0;
    });
  
    renderizarTemplates(templates);
});
