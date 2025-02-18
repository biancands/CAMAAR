FactoryBot.define do
  factory :turma do
    sequence(:codigo) { |n| "TURMA#{n}" } # Garante códigos únicos
    nome { |turma| "Turma #{turma.codigo}" }
    periodo { "2023.1" }
    horario { "08:00 - 10:00" }
    association :disciplina
  end
end
