FactoryBot.define do
  factory :disciplina do
    sequence(:codigo) { |n| "CIC#{n.to_s.rjust(4, '0')}" }
    nome { Faker::Educator.course_name }
  end
end
