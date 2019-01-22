describe Api::Controllers::Products::Index, type: :action do
  let(:action) { described_class.new repo: repo }
  let(:params) { Hash[] }

  let(:repo) { double all_with_assets: [product] }
  let(:product) { Product.new(name: 'Eggs') }

  it 'exposes all products' do
    action.call(params)
    expect(action.exposures[:products]).to eq [product]
  end
end
