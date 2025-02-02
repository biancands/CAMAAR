require 'rails_helper'

RSpec.describe 'Associação Turma-Usuário', type: :model do
  let(:turma) { create(:turma) }
  let(:usuario) { create(:usuario) }

  it "associa corretamente turmas e usuários" do
    turma.usuarios << usuario
    expect(turma.usuarios).to include(usuario)
    expect(usuario.turmas).to include(turma)
  end
end
