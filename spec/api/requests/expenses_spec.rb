describe 'API V1 Expenses', type: :request do
  let(:repo) { ExpenseRepository.new }
  let(:asset_repo) { AssetRepository.new }

  after do
    repo.clear
    asset_repo.clear
  end

  describe 'index' do
    let(:chickens) { asset_repo.create(name: 'Chickens') }
    let!(:chicken_feed) { repo.create(name: 'Chicken Feed', price: 3.14, period: 'daily', expensable_type: 'assets', expensable_id: chickens.id) }

    let(:ducks) { asset_repo.create(name: 'Ducks') }
    let!(:duck_feed) { repo.create(name: 'Duck Feed', price: 1.85, period: 'daily', expensable_type: 'assets', expensable_id: ducks.id) }

    it 'returns all expenses' do
      get '/expenses'

      expect(last_response.status).to eq 200

      expected = [
        {
          'id' => chicken_feed.id,
          'type' => 'expenses',
          'attributes' => {
            'name' => 'Chicken Feed',
            'price' => 3.14,
            'period' => 'daily',
            'start_date' => nil,
            'end_date' => nil
          },
          'relationships' => {
            'expensable' => {
              'data' => {
                'id' => chickens.id,
                'type' => 'assets'
              }
            }
          }
        },
        {
          'id' => duck_feed.id,
          'type' => 'expenses',
          'attributes' => {
            'name' => 'Duck Feed',
            'price' => 1.85,
            'period' => 'daily',
            'start_date' => nil,
            'end_date' => nil
          },
          'relationships' => {
            'expensable' => {
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
