FactoryBot.define do
  factory :usuario do
    nome { Faker::Name.name }
    sequence(:email) { |n| "usuario#{n}@example.com" }
    tipo { %w[Docente Discente].sample }
    password_digest { BCrypt::Password.create('senha123') }
  end
end
