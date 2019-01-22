describe Api::Controllers::Assets::Show, type: :action do
  let(:action) { described_class.new repo: repo }
  let(:params) { Hash[id: id] }
  let(:id) { 42 }

  let(:repo) { double }
  let(:asset) { Asset.new(name: 'Squirrels') }

  it 'exposes all assets' do
    allow(repo).to receive(:find_with_product).with(id).and_return(asset)
    action.call(params)
    expect(action.exposures[:asset]).to eq asset
  end
end
