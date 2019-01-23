describe 'API V1 Productions', type: :request do
  let(:repo) { AssetEventRepository.new }
  let(:asset_repo) { AssetRepository.new }

  after do
    repo.clear
    asset_repo.clear
  end

  describe 'index' do
    let(:chickens) { asset_repo.create(name: 'Chickens') }
    let(:chicken_date) { '2019-01-13' }
    let!(:chicken_event) { repo.create(count: 42, date: chicken_date, asset_id: chickens.id) }

    let(:ducks) { asset_repo.create(name: 'Ducks') }
    let(:duck_date) { '2018-02-17' }
    let!(:duck_event) { repo.create(count: 7, date: duck_date, asset_id: ducks.id) }

    it 'returns all asset events' do
      get '/asset_events'

      expect(last_response.status).to eq 200

      expected = [
        {
          'id' => chicken_event.id,
          'type' => 'asset-events',
          'attributes' => {
            'count' => 42,
            'date' => chicken_date
          },
          'relationships' => {
            'asset' => {
              'data' => {
                'id' => chickens.id,
                'type' => 'assets'
              }
            }
          }
        },
        {
          'id' => duck_event.id,
          'type' => 'asset-events',
          'attributes' => {
            'count' => 7,
            'date' => duck_date
          },
          'relationships' => {
            'asset' => {
              'data' => {
                'id' => ducks.id,
                'type' => 'assets'
              }
            }
          }
        }
      ]
      expect(json_response).to eq expected
    end
  end
end
