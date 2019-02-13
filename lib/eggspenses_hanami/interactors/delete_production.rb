require 'hanami/interactor'

class DeleteProduction
  include Hanami::Interactor

  def initialize(repo: ProductionRepository.new)
    @repo = repo
  end

  def call(id)
    @repo.delete(id)
  end
end
