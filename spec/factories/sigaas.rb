# spec/factories/sigaas.rb
FactoryBot.define do
  factory :sigaa do
    tipo_dado { "Importação Completa" }
    detalhes { { disciplinas: 5, turmas: 10 } }
  end
end
