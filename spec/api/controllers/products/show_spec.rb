describe Api::Controllers::Products::Show, type: :action do
  let(:action) { described_class.new repo: repo }
  let(:params) { Hash[id: id] }
  let(:id) { 42 }

  let(:repo) { double }
  let(:product) { Product.new(name: 'Nuts') }

  it 'exposes all products' do
    allow(repo).to receive(:find_with_asset).with(id).and_return(product)
    action.call(params)
    expect(action.exposures[:product]).to eq product
  end
end
