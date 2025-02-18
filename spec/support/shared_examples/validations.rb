RSpec.shared_examples "validates presence of codigo" do
    it "é inválido sem código" do
      subject.codigo = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:codigo]).to include("não pode ficar em branco")
    end
  end
  
  RSpec.shared_examples "validates uniqueness of codigo" do
    it "exige código único" do
      create(described_class.name.underscore.to_sym, codigo: "CIC0097")
      subject.codigo = "CIC0097"
      expect(subject).not_to be_valid
      expect(subject.errors[:codigo]).to include("já está em uso")
    end
  end
  