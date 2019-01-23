RSpec.describe ExpenseRepository, type: :repository do
  describe 'loading all with expensable' do
    let(:asset_repo) { AssetRepository.new }
    let!(:asset) { asset_repo.create(name: 'Foo') }

    after do
      subject.clear
      asset_repo.clear
    end

    before do
      subject.create(name: 'Upkeep', price: 3.14, period: 'daily', expensable_type: 'assets', expensable_id: asset.id)
    end

    it 'loads expensable entity' do
      expense = subject.all_with_expensable.first

      expect(expense.expensable).to eq asset
    end
  end
end
