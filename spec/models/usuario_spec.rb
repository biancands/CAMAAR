require 'rails_helper'

RSpec.describe Usuario, type: :model do
  let(:usuario) { build(:usuario) }

  it "é válido com atributos corretos" do
    expect(usuario).to be_valid
  end

  it "é inválido sem email" do
    usuario.email = nil
    expect(usuario).not_to be_valid
  end

  it "pode estar associado a múltiplas turmas" do
    usuario = create(:usuario)
    2.times { usuario.turmas << create(:turma) }
    expect(usuario.turmas.count).to eq(2)
  end
end
