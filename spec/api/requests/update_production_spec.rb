describe 'API V1 Productions', type: :request do
  let(:repo) { ProductionRepository.new }
  let(:product_repo) { ProductRepository.new }
  let(:asset_repo) { AssetRepository.new }

  after do
    repo.clear
    product_repo.clear
    asset_repo.clear
  end

  describe 'update' do
    let(:chickens) { asset_repo.create(name: 'Chickens') }
    let(:eggs) { product_repo.create(name: 'Chicken Eggs', asset_id: chickens.id) }
    let(:chicken_date) { '2019-01-13' }
    let!(:chicken_eggs_production) { repo.create(count: 42, date: chicken_date, product_id: eggs.id) }

    it 'updates the production' do
      patch "/productions/#{chicken_eggs_production.id}"

      expect(last_response.status).to eq 200

      expected = {
        'id' => chicken_eggs_production.id,
        'type' => 'productions',
        'attributes' => {
          'count' => 42,
          'date' => chicken_date
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
      expect(json_response).to eq expected
    end
  end
end
