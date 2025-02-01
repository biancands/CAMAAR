require 'rails_helper'

RSpec.describe Turma, type: :model do
  let(:turma) { build(:turma) }

  it "é válida com atributos corretos" do
    expect(turma).to be_valid
  end

  it "é inválida sem código" do
    turma.codigo = nil
    expect(turma).not_to be_valid
    expect(turma.errors[:codigo]).to include("não pode ficar em branco")
  end

  it "exige código único por disciplina" do
    turma_existente = create(:turma)
    nova_turma = build(:turma, codigo: turma_existente.codigo, disciplina: turma_existente.disciplina)
    expect(nova_turma).not_to be_valid
  end
end
