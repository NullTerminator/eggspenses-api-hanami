describe Expense, type: :entity do
  subject { described_class.new(id: id, name: name, expensable: asset) }
  let(:id) { 97 }
  let(:name) { 'foo' }
  let(:asset) { Asset.new(name: 'bar') }

  it 'can be initialized with attrs' do
    expect(subject.id).to eq id
    expect(subject.name).to eq name
    expect(subject.expensable).to eq asset
  end
end
