describe 'API V1 Products', type: :request do
  let(:repo) { ProductRepository.new }
  let(:asset_repo) { AssetRepository.new }

  after do
    repo.clear
    asset_repo.clear
  end

  describe 'index' do
    let(:chickens) { asset_repo.create(name: 'Chickens') }
    let!(:eggs) { repo.create(name: 'Chicken Eggs', asset_id: chickens.id) }
    let(:ducks) { asset_repo.create(name: 'Ducks') }
    let!(:duck_eggs) { repo.create(name: 'Duck Eggs', asset_id: ducks.id) }

    it 'returns all products' do
      get '/products'

      expect(last_response.status).to eq 200

      expected = [
        {
          'id' => eggs.id,
          'type' => 'products',
          'attributes' => {
            'name' => eggs.name
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
          'id' => duck_eggs.id,
          'type' => 'products',
          'attributes' => {
            'name' => duck_eggs.name
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
