class AvaliacoesController < ApplicationController
  def show
    @is_admin = true

        # Simulação de dados (substitua por uma busca no banco de dados no futuro)
    @avaliacoes = [
      { id: 1, materia: "Matemática", semestre: "2023.1", professor: "João Silva" },
      { id: 2, materia: "Português", semestre: "2023.1", professor: "Maria Oliveira" },
      { id: 3, materia: "História", semestre: "2023.1", professor: "Carlos Souza" },
      { id: 4, materia: "Geografia", semestre: "2023.1", professor: "Ana Costa" },
      { id: 5, materia: "Física", semestre: "2023.1", professor: "Pedro Santos" },
      { id: 6, materia: "Química", semestre: "2023.1", professor: "Luiza Fernandes" },
      { id: 7, materia: "Biologia", semestre: "2023.1", professor: "Fernando Lima" },
      ]
  end
end
