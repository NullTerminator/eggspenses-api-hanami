module Api
  module Controllers
    module AssetEvents
      class Index
        include Api::Action
        accept :json

        expose :asset_events

        def initialize(interactor: LoadAssetEvents.new)
          @interactor = interactor
        end

        def call(params)
          @asset_events = @interactor.call(params.to_h.select { |k, v| [:from_date, :to_date].include?(k) }).asset_events
        end
      end
    end
  end
end
