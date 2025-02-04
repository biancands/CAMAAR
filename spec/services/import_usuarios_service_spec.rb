require 'rails_helper'
# issue 100 - Importação de usuários
RSpec.describe ImportUsuariosService, type: :service do
  let(:json_data) {
    [
      {
        "code": "CIC0097",
        "classCode": "TA",
        "semester": "2021.2",
        "dicente": [
          {
            "nome": "Teste Usuário",
            "email": "teste@exemplo.com",
            "matricula": "123456789",
            "ocupacao": "dicente"
          }
        ]
      }
    ].to_json
  }

  let(:file_path) { Rails.root.join('tmp', 'test_import.json') }

  before do
    File.write(file_path, json_data)
  end

  after do
    File.delete(file_path) if File.exist?(file_path)
  end

  it "deve importar usuários corretamente" do
    expect {
      ImportUsuariosService.import_from_json(file_path)
    }.to change(Usuario, :count).by(1)

    usuario = Usuario.find_by(email: "teste@exemplo.com")
    expect(usuario).not_to be_nil
    expect(usuario.nome).to eq("Teste Usuário")
  end

  it "não deve importar usuários duplicados" do
    ImportUsuariosService.import_from_json(file_path)

    expect {
      ImportUsuariosService.import_from_json(file_path)
    }.to_not change(Usuario, :count)

    usuario = Usuario.find_by(email: "teste@exemplo.com")
    expect(usuario).not_to be_nil
  end
end
