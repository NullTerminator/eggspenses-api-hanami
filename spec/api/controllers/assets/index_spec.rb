describe Api::Controllers::Assets::Index, type: :action do
  let(:action) { described_class.new repo: repo }
  let(:params) { Hash[] }

  let(:repo) { double all_with_products: [asset] }
  let(:asset) { Asset.new(name: 'Squirrels') }

  it 'exposes all assets' do
    action.call(params)
    expect(action.exposures[:assets]).to eq [asset]
  end
end
