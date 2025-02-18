require "rails_helper"
require "support/shared_examples/validations"

RSpec.describe Turma, type: :model do
  subject { build(:turma) }

  it "é válida com atributos corretos" do
    expect(subject).to be_valid
  end

  include_examples "validates presence of codigo"
  include_examples "validates uniqueness of codigo"
end
