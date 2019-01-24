describe Api::Controllers::SaleItems::Index, type: :action do
  let(:action) { described_class.new repo: repo }
  let(:params) { Hash[] }

  let(:repo) { double all_with_product_and_expenses: [sale_item] }
  let(:sale_item) { SaleItem.new(name: 'Desk') }

  it 'exposes all sale items' do
    action.call(params)
    expect(action.exposures[:sale_items]).to eq [sale_item]
  end
end
