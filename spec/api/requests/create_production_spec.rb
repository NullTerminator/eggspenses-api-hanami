describe 'API V1 Create Production', type: :request do
  let(:repo) { ProductionRepository.new }
  let(:product_repo) { ProductRepository.new }
  let(:asset_repo) { AssetRepository.new }

  after do
    repo.clear
    product_repo.clear
    asset_repo.clear
  end

  describe 'create' do
    let(:chickens) { asset_repo.create(name: 'Chickens') }
    let(:eggs) { product_repo.create(name: 'Chicken Eggs', asset_id: chickens.id) }
    let(:date) { '2019-01-13' }

    it 'creates a production and returns it' do
      post '/productions', { product_id: eggs.id, count: 42, date: date }

      expect(last_response.status).to eq 200

      expected = {
        'type' => 'productions',
        'attributes' => {
          'count' => 42,
          'date' => date
        },
        'relationships' => {
          'product' => {
            'data' => {
              'id' => eggs.id,
              'type' => 'products'
            }
          }
        }
      }

      response = json_response
      id = response.delete('id')

      expect(id).to be_an Integer
      expect(response).to eq expected
      expect(repo.find(id)).to be_a Production
    end
  end
end
