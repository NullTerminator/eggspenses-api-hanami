require 'spec_helper'

describe LoadProductions do
  let(:repo) { ProductionRepository.new }
  let(:result) { subject.call(args) }

  let!(:old_production) { repo.create(count: 3, date: Date.parse('2018-02-05')) }
  let!(:middle_production) { repo.create(count: 14, date: Date.parse('2018-04-12')) }
  let!(:new_production) { repo.create(count: 27, date: Date.parse('2018-07-23')) }

  after do
    repo.clear
  end

  context 'with no filters' do
    let(:result) { subject.call }

    it 'succeeds' do
      expect(result).to be_successful
    end

    it 'loads productions' do
      expect(result.productions.size).to eq 3
    end
  end

  context 'filtered by from_date' do
    let(:args) { { from_date: '2018-06-17' } }

    it 'succeeds' do
      expect(result).to be_successful
    end

    it 'loads productions' do
      expect(result.productions.size).to eq 1
      expect(result.productions.first.count).to eq new_production.count
    end
  end

  context 'filtered by to_date' do
    let(:args) { { to_date: '2018-03-11' } }

    it 'succeeds' do
      expect(result).to be_successful
    end

    it 'loads productions' do
      expect(result.productions.size).to eq 1
      expect(result.productions.first.count).to eq old_production.count
    end
  end

  context 'filtered by from_date and to_date' do
    let(:args) { { from_date: '2018-03-11', to_date: '2018-06-21' } }

    it 'succeeds' do
      expect(result).to be_successful
    end

    it 'loads productions' do
      expect(result.productions.size).to eq 1
      expect(result.productions.first.count).to eq middle_production.count
    end
  end
end
