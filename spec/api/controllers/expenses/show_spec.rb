describe Api::Controllers::Expenses::Show, type: :action do
  let(:action) { described_class.new repo: repo }
  let(:params) { Hash[id: id] }
  let(:id) { 42 }

  let(:repo) { double }
  let(:expense) { Expense.new(name: 'Squirrels') }

  it 'exposes all expenses' do
    allow(repo).to receive(:find_with_expensable).with(id).and_return(expense)
    action.call(params)
    expect(action.exposures[:expense]).to eq expense
  end
end
