module Api
  module Controllers
    module SaleItems
      class Show
        include Api::Action
        accept :json

        expose :sale_item

        def initialize(repo: SaleItemRepository.new)
          @repo = repo
        end

        def call(params)
          @sale_item = @repo.find_with_product_and_expenses(params[:id])
        end
      end
    end
  end
end
