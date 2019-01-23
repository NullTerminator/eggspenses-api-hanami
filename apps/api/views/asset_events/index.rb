module Api
  module Views
    module AssetEvents
      class Index
        include Api::View
        layout false

        def serializer
          Serializers::AssetEventSerializer
        end

        def render
          _raw Hash[data: asset_events.map { |asset_event| serializer.new(asset_event).to_h }].to_json
        end
      end
    end
  end
end
