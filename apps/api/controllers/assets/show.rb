module Api
  module Controllers
    module Assets
      class Show
        include Api::Action
        accept :json

        expose :asset

        def initialize(repo: AssetRepository.new)
          @repo = repo
        end

        def call(params)
          @asset = @repo.find_with_product(params[:id])
        end
      end
    end
  end
end
