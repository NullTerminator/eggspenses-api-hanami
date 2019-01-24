describe Api::Controllers::SaleItems::Show, type: :action do
  let(:action) { described_class.new repo: repo }
  let(:params) { Hash[id: id] }
  let(:id) { 42 }

  let(:repo) { double }
  let(:sale_item) { SaleItem.new(name: 'Nuts') }

  it 'exposes all sale_items' do
    allow(repo).to receive(:find_with_product_and_expenses).with(id).and_return(sale_item)
    action.call(params)
    expect(action.exposures[:sale_item]).to eq sale_item
  end
end
