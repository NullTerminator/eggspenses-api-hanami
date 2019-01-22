describe 'API V1 Assets', type: :request do
  let(:repo) { AssetRepository.new }

  after do
    repo.clear
    ProductRepository.new.clear
  end

  describe 'index' do
    let!(:chickens) { repo.create_with_products(name: 'Chickens', products: [{ name: 'eggs' }]) }
    let!(:ducks) { repo.create(name: 'Ducks') }

    it 'returns all assets' do
      get '/assets'

      expect(last_response.status).to eq 200

      expected = [
        {
          'id' => chickens.id,
          'type' => 'assets',
          'attributes' => {
            'name' => chickens.name
          },
          'relationships' => {
            'products' => {
              'data' => [
                {
                  'id' => chickens.products.first.id,
                  'type' => 'products'
                }
              ]
            }
          }
        },
        {
          'id' => ducks.id,
          'type' => 'assets',
          'attributes' => {
            'name' => ducks.name
          },
          'relationships' => {
            'products' => {
              'data' => [
              ]
            }
          }
        }
      ]
      expect(json_response).to eq expected
    end
  end
end
