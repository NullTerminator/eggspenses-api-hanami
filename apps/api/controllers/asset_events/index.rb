module Api
  module Controllers
    module AssetEvents
      class Index
        include Api::Action
        accept :json

        expose :asset_events

        def initialize(repo: AssetEventRepository.new)
          @repo = repo
        end

        def call(params)
          @asset_events = @repo.all_with_assets
        end
      end
    end
  end
end
