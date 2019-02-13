require 'hanami/interactor'

class CreateProduction
  include Hanami::Interactor

  expose :production

  def initialize(repo: ProductionRepository.new)
    @repo = repo
  end

  def call(params)
    prod = @repo.create(params)
    @production = @repo.find_with_products(prod.id)
  end
end
