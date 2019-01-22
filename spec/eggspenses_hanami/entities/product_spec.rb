describe Product, type: :entity do
  subject { described_class.new(id: id, name: name) }
  let(:id) { 97 }
  let(:name) { 'foo' }

  it 'can be initialized with attrs' do
    expect(subject.id).to eq id
    expect(subject.name).to eq name
  end
end
