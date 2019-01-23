describe Api::Controllers::AssetEvents::Index, type: :action do
  let(:action) { described_class.new repo: repo }
  let(:params) { Hash[] }

  let(:repo) { double all_with_assets: [event] }
  let(:event) { AssetEvent.new(count: 42) }

  it 'exposes all asset events' do
    action.call(params)
    expect(action.exposures[:asset_events]).to eq [event]
  end
end
