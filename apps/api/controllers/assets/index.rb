module Api
  module Controllers
    module Assets
      class Index
        include Api::Action
        accept :json

        expose :assets

        def initialize(repo: AssetRepository.new)
          @repo = repo
        end

        def call(params)
          @assets = @repo.all_with_products
        end
      end
    end
  end
end
