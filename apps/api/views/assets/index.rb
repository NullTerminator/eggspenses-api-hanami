module Api
  module Views
    module Assets
      class Index
        include Api::View
        layout false

        def serializer
          Serializers::AssetSerializer
        end

        def render
          _raw Hash[data: assets.map { |asset| serializer.new(asset).to_h }].to_json
        end
      end
    end
  end
end
