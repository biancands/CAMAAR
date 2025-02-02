require 'rails_helper'

RSpec.describe Disciplina, type: :model do
  let(:disciplina) { build(:disciplina) }

  it "é válida com atributos corretos" do
    expect(disciplina).to be_valid
  end

  it "é inválida sem código" do
    disciplina.codigo = nil
    expect(disciplina).not_to be_valid
    expect(disciplina.errors[:codigo]).to include("não pode ficar em branco")
  end

  it "exige código único" do
    create(:disciplina, codigo: "CIC0097")
    disciplina.codigo = "CIC0097"
    expect(disciplina).not_to be_valid
    expect(disciplina.errors[:codigo]).to include("já está em uso")
  end
end
