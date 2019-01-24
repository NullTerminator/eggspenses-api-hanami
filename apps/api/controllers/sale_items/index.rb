module Api
  module Controllers
    module SaleItems
      class Index
        include Api::Action
        accept :json

        expose :sale_items

        def initialize(repo: SaleItemRepository.new)
          @repo = repo
        end

        def call(params)
          @sale_items = @repo.all_with_product_and_expenses
        end
      end
    end
  end
end
