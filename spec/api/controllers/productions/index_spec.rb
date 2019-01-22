describe Api::Controllers::Productions::Index, type: :action do
  let(:action) { described_class.new interactor: interactor }
  let(:params) { Hash[from_date: from_date, to_date: to_date] }
  let(:from_date) { '2018-12-17' }
  let(:to_date) { '2019-01-17' }

  let(:interactor) { double call: response }
  let(:response) { double productions: [production] }
  let(:production) { Production.new(count: 4) }

  it 'passes date params to interactor' do
    expect(interactor).to receive(:call).with(from_date: from_date, to_date: to_date)
    action.call(params)
  end

  it 'exposes all productions' do
    action.call(params)
    expect(action.exposures[:productions]).to eq [production]
  end
end
