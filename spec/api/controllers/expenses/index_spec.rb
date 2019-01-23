describe Api::Controllers::Expenses::Index, type: :action do
  let(:action) { described_class.new repo: repo }
  let(:params) { Hash[] }

  let(:repo) { double all_with_expensable: [expense] }
  let(:expense) { Expense.new(amount: 42.2) }

  it 'exposes all expenses' do
    action.call(params)
    expect(action.exposures[:expenses]).to eq [expense]
  end
end
