describe Api::Views::Productions::Index, type: :view do
  let(:exposures) { Hash[productions: [production], format: :json] }
  let(:view)      { described_class.new(nil, exposures) }
  let(:rendered)  { view.render }
  let(:serializer_class) { class_double(Api::Serializers::ProductionSerializer) }

  let(:production) { Production.new(id: 42, count: 27) }
  let(:serialized) { { foo: 'bar' } }

  before do
    serializer = double(to_h: serialized)
    allow(serializer_class).to receive(:new).with(production).and_return(serializer)
    allow(view).to receive(:serializer).and_return(serializer_class)
  end

  it 'renders json' do
    expect(rendered).to eq Hash['data' => [serialized.to_h]].to_json
  end
end
