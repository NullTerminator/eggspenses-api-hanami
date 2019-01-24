describe Api::Views::SaleItems::Index, type: :view do
  let(:exposures) { Hash[sale_items: [sale_item], format: :json] }
  let(:view)      { described_class.new(nil, exposures) }
  let(:rendered)  { view.render }
  let(:serializer_class) { class_double(Api::Serializers::SaleItemSerializer) }

  let(:sale_item) { SaleItem.new(id: 42, name: 'foo') }
  let(:serialized) { { foo: 'bar' } }

  before do
    serializer = double(to_h: serialized)
    allow(serializer_class).to receive(:new).with(sale_item).and_return(serializer)
    allow(view).to receive(:serializer).and_return(serializer_class)
  end

  it 'renders json' do
    expect(rendered).to eq Hash['data' => [serialized.to_h]].to_json
  end
end
