describe Api::Views::Products::Index, type: :view do
  let(:exposures) { Hash[products: [product], format: :json] }
  let(:view)      { described_class.new(nil, exposures) }
  let(:rendered)  { view.render }
  let(:serializer_class) { class_double(Api::Serializers::ProductSerializer) }

  let(:product) { Product.new(id: 42, name: 'foo') }
  let(:serialized) { { foo: 'bar' } }

  before do
    serializer = double(to_h: serialized)
    allow(serializer_class).to receive(:new).with(product).and_return(serializer)
    allow(view).to receive(:serializer).and_return(serializer_class)
  end

  it 'renders json' do
    expect(rendered).to eq Hash['data' => [serialized.to_h]].to_json
  end
end
