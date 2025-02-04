# spec/models/sigaa_spec.rb
require 'rails_helper'

RSpec.describe Sigaa, type: :model do
  it "registra detalhes da importação" do
    sigaa = build(:sigaa)
    expect(sigaa).to be_valid
  end

  it "é inválido sem tipo de dado" do
    sigaa = build(:sigaa, tipo_dado: nil)
    expect(sigaa).not_to be_valid
    expect(sigaa.errors[:tipo_dado]).to include("não pode ficar em branco")
  end
end
