document.addEventListener("DOMContentLoaded", function () {
  console.log("✅ JavaScript carregado!");

  const templates = [
      { id: 1, nome: "Template 1" },
      { id: 2, nome: "Template 2" },
      { id: 3, nome: "Template 3" }
  ];

  const turmas = [
      { id: 1, nome: "Turma A - 2023.1", codigo: "123" },
      { id: 2, nome: "Turma B - 2023.2", codigo: "456" },
      { id: 3, nome: "Turma C - 2024.1", codigo: "789" }
  ];

  const templateSelect = document.getElementById("template-select");
  templateSelect.innerHTML = "<option value='' disabled selected>Selecione um template</option>"; // Reset inicial

  templates.forEach(template => {
      const option = document.createElement("option");
      option.value = template.id;
      option.textContent = template.nome;
      templateSelect.appendChild(option);
  });

  console.log("Templates carregados:", templates);

  const turmasList = document.getElementById("turmas-list");
  turmasList.innerHTML = ""; // Reset inicial

  turmas.forEach(turma => {
      const turmaDiv = document.createElement("div");
      turmaDiv.classList.add("turma-item");

      turmaDiv.innerHTML = `
          <label>
              <span>${turma.nome}</span>
              <span>Código: ${turma.codigo}</span>
              <input type="checkbox" name="turma" value="${turma.id}">
          </label>
      `;

      turmasList.appendChild(turmaDiv);
  });

  console.log("Turmas carregadas:", turmas);
});



function enviarFormulario() {
    // Simulação de envio do formulário
    const templateSelecionado = document.getElementById('template-select').value;
    const turmasSelecionadas = document.querySelectorAll('input[name="turma"]:checked');

    // Verifica se um template foi selecionado
    if (!templateSelecionado) {
      alert('Selecione um template antes de enviar.');
      return;
    }

    // Verifica se pelo menos uma turma foi selecionada
    if (turmasSelecionadas.length === 0) {
      alert('Selecione pelo menos uma turma antes de enviar.');
      return;
    }

    // Exibe o aviso de formulários enviados
    const aviso = document.getElementById('aviso');
    aviso.style.display = 'block';

    // Reseta os campos do formulário
    document.getElementById('template-select').value = '';
    document.querySelectorAll('input[name="turma"]').forEach((checkbox) => {
      checkbox.checked = false;
    });

    // Oculta o aviso após 6 segundos
    setTimeout(() => {
      aviso.style.display = 'none';
    }, 6000);}