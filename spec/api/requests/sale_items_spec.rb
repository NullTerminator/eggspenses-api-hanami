describe 'API V1 Sale Items', type: :request do
  let(:repo) { SaleItemRepository.new }
  let(:product_repo) { ProductRepository.new }
  let(:asset_repo) { AssetRepository.new }
  let(:expense_repo) { ExpenseRepository.new }

  after do
    repo.clear
    asset_repo.clear
    product_repo.clear
    expense_repo.clear
  end

  describe 'index' do
    let(:chickens) { asset_repo.create(name: 'Chickens') }
    let(:eggs) { product_repo.create(name: 'Chicken Eggs', asset_id: chickens.id) }
    let!(:dozen_chicken_eggs) { repo.create(name: 'Dozen Chicken Eggs', price: 5, product_count: 12, product_id: eggs.id) }
    let!(:chicken_egg_cartons) { expense_repo.create(name: 'Chicken Egg Cartons', price: 0.25, expensable_type: 'sale_items', expensable_id: dozen_chicken_eggs.id) }

    let(:ducks) { asset_repo.create(name: 'Ducks') }
    let(:duck_eggs) { product_repo.create(name: 'Duck Eggs', asset_id: ducks.id) }
    let!(:dozen_duck_eggs) { repo.create(name: 'Dozen Duck Eggs', price: 6, product_count: 12, product_id: duck_eggs.id) }
    let!(:duck_egg_cartons) { expense_repo.create(name: 'Duck Egg Cartons', price: 0.25, expensable_type: 'sale_items', expensable_id: dozen_duck_eggs.id) }

    it 'returns all sale items' do
      get '/sale_items'

      expect(last_response.status).to eq 200

      expected = [
        {
          'id' => dozen_chicken_eggs.id,
          'type' => 'sale-items',
          'attributes' => {
            'name' => 'Dozen Chicken Eggs',
            'price' => 5.0,
            'product_count' => 12
          },
          'relationships' => {
            'product' => {
              'data' => {
                'id' => eggs.id,
                'type' => 'products'
              }
            },
            'expenses' => {
              'data' => [
                {
                  'id' => chicken_egg_cartons.id,
                  'type' => 'expenses'
                }
              ]
            }
          }
        },
        {
          'id' => dozen_duck_eggs.id,
          'type' => 'sale-items',
          'attributes' => {
            'name' => 'Dozen Duck Eggs',
            'price' => 6.0,
            'product_count' => 12
          },
          'relationships' => {
            'product' => {
              'data' => {
                'id' => duck_eggs.id,
                'type' => 'products'
              }
            },
            'expenses' => {
              'data' => [
                {
                  'id' => duck_egg_cartons.id,
                  'type' => 'expenses'
                }
              ]
            }
          }
        }
      ]
      expect(json_response).to eq expected
    end
  end
end
