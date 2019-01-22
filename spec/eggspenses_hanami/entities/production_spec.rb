describe Production, type: :entity do
  subject { described_class.new(id: id, count: count, date: date) }
  let(:id) { 97 }
  let(:count) { 42 }
  let(:date) { Date.today }

  it 'can be initialized with attrs' do
    expect(subject.id).to eq id
    expect(subject.count).to eq count
    expect(subject.date).to eq date
  end
end
