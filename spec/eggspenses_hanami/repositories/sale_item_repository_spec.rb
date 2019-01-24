RSpec.describe SaleItemRepository, type: :repository do
  describe 'loading all with product and expenses' do
    let(:asset_repo) { AssetRepository.new }
    let(:product_repo) { ProductRepository.new }
    let(:expense_repo) { ExpenseRepository.new }

    let(:chickens) { asset_repo.create(name: 'Chickens') }
    let(:eggs) { product_repo.create(name: 'Chicken Eggs', asset_id: chickens.id) }
    let!(:dozen_chicken_eggs) { subject.create(name: 'Dozen Chicken Eggs', price: 5, product_count: 12, product_id: eggs.id) }
    let!(:chicken_egg_cartons) { expense_repo.create(name: 'Chicken Egg Cartons', price: 0.25, expensable_type: 'sale_items', expensable_id: dozen_chicken_eggs.id) }

    after do
      subject.clear
      asset_repo.clear
      product_repo.clear
      expense_repo.clear
    end

    it 'loads product and expenses on sale items' do
      sale_item = subject.all_with_product_and_expenses.first

      expect(sale_item.product).to eq eggs
      expect(sale_item.expenses.count).to eq 1
      expect(sale_item.expenses.first).to eq chicken_egg_cartons
    end
  end
end
