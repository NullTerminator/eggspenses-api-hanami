require 'hanami/interactor'

class LoadProductions
  include Hanami::Interactor

  expose :productions

  def initialize(repo: ProductionRepository.new)
    @repo = repo
  end

  def call(query={})
    from = query[:from_date]
    to = query[:to_date]

    @productions = if from && to
      @repo.find_in_dates_with_products(from, to)
    elsif from
      @repo.find_after_date_with_products(from)
    elsif to
      @repo.find_before_date_with_products(to)
    else
      @repo.all_with_products
    end
  end

end
