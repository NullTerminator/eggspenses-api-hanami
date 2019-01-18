RSpec.describe Asset, type: :entity do
  subject { described_class.new(id: id, name: name, count: count) }
  let(:id) { 97 }
  let(:name) { 'foo' }
  let(:count) { 42 }

  it 'can be initialized with attrs' do
    expect(subject.id).to eq id
    expect(subject.name).to eq name
    expect(subject.count).to eq count
  end
end
