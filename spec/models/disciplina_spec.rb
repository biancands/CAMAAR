require "rails_helper"
require "support/shared_examples/validations"

RSpec.describe Disciplina, type: :model do
  subject { build(:disciplina) }

  it "é válida com atributos corretos" do
    expect(subject).to be_valid
  end

  include_examples "validates presence of codigo"
  include_examples "validates uniqueness of codigo"
end
