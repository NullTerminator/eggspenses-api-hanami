module Api
  module Controllers
    module Products
      class Index
        include Api::Action
        accept :json

        expose :products

        def initialize(repo: ProductRepository.new)
          @repo = repo
        end

        def call(params)
          @products = @repo.all_with_assets
        end
      end
    end
  end
end
