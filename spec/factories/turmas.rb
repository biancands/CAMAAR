FactoryBot.define do
  factory :turma do
    sequence(:codigo) { |n| "TURMA#{n}" }
    nome { "Turma #{codigo}" }
    periodo { "2023.1" }
    association :disciplina
  end
end
