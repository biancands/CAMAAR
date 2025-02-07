require 'csv'

class ResultadosController < ApplicationController
  def index
    @is_admin = true

    @turmas = Turma.includes(:disciplina, :usuarios).all
    @professores = Usuario.where(tipo: "Docente").index_by(&:id)
    
    @avaliacoes = @turmas.map do |turma|
      professor_id = turma.usuarios.first&.id
      {
        id: turma.id,
        materia: turma.disciplina.nome,
        semestre: turma.periodo,
        professor: @professores[professor_id]&.nome
      }
    end
  end

  def download_csv
    puts params
    turma = Turma.includes(:disciplina, :usuarios, formularios: { perguntas: :respostas }).find(params[:id])

    @form = Formulario.includes(:usuario, turma: :disciplina, perguntas: :respostas).find(params[:id])
    professor = turma.usuarios.first&.nome || "Desconhecido"

    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["Turma ID", "Matéria", "Semestre", "Professor", "Formulário ID", "Título", "Descrição", "Data Criação", "Pergunta ID", "Pergunta", "Resposta ID", "Resposta", "Aluno"]

      turma.formularios.each do |formulario|
        formulario.perguntas.each do |pergunta|
          pergunta.respostas.each do |resposta|
            aluno = Usuario.find_by(id: resposta.usuario_id)&.email || "Desconhecido"
            csv << [
              turma.id, turma.disciplina.nome, turma.periodo, professor,
              formulario.id, formulario.titulo, formulario.descricao, formulario.created_at.strftime("%d/%m/%Y"),
              pergunta.id, pergunta.texto,
              resposta.id, resposta.conteudo, aluno
            ]
          end
        end
      end
    end

    send_data csv_data, filename: "relatorio_turma_#{turma.id}.csv", type: 'text/csv'
  end
end