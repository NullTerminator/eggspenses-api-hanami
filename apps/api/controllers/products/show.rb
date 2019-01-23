module Api
  module Controllers
    module Products
      class Show
        include Api::Action
        accept :json

        expose :product

        def initialize(repo: ProductRepository.new)
          @repo = repo
        end

        def call(params)
          @product = @repo.find_with_asset(params[:id])
        end
      end
    end
  end
end
