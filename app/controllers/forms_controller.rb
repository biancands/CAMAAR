class FormsController < ApplicationController
  def show
    forms_data = [
      {
        id: 1,
        nome_materia: "Matemática",
        nome_professor: "João Silva",
        semestre: "2023.1",
        descricao: "Questões sobre álgebra e geometria.",
        data_criacao: "2023-10-01",
        perguntas: [
          {
            id_pergunta: 1,
            texto: "Como você avalia o material?",
            tipo_resposta: "Múltipla escolha",
            escolhas: ["Muito bom", "Bom", "Satisfatório", "Ruim", "Péssimo"]
          },
          {
            id_pergunta: 2,
            texto: "Campo aberto:",
            tipo_resposta: "Dissertativa",
            placeholder: "Fale sobre sua experiencia"
          },
          {
            id_pergunta: 3,
            texto: "Pergunta:",
            tipo_resposta: "Dissertativa",
            placeholder: "Placeholder"
          }
        ]
      },
      {
        id: 2,
        nome_materia: "Português",
        nome_professor: "Maria Oliveira",
        semestre: "2023.1",
        descricao: "Questões sobre gramática e literatura.",
        data_criacao: "2023-10-02",
        perguntas: [
          {
            id_pergunta: 1,
            texto: "Qual é o sujeito da frase 'O gato caçou o rato'?",
            tipo_resposta: "Múltipla escolha",
            escolhas: ["O gato", "O rato", "Caçou", "Nenhuma das alternativas"]
          },
          {
            id_pergunta: 2,
            texto: "Identifique o verbo na frase 'Ela cantou lindamente'.",
            tipo_resposta: "Dissertativa",
            placeholder: "Digite o verbo aqui..."
          }
        ]
      }
    ]

    @form = forms_data.find { |form| form[:id] == params[:id].to_i }

    unless @form
      redirect_to root_path, alert: "Formulário não encontrado."
    end
  end
end