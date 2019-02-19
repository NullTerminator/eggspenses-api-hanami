require 'hanami/interactor'

class UpdateProduction
  include Hanami::Interactor

  expose :production

  def initialize(repo: ProductionRepository.new)
    @repo = repo
  end

  def call(id, params)
    prod = @repo.update(id, params)
    @production = @repo.find_with_products(prod.id)
  end
end
