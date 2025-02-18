FactoryBot.define do
  factory :usuario do
    nome { "Agatha Moura" }
    email { "agatha@example.com" }
    password { "senha123" }
    tipo { "Discente" }
    matricula { "123456" }
    curso { "Engenharia" }  # Valor válido para o atributo obrigatório
    departamento { "Departamento X" }
    formacao { "Graduação" }
  end
end
