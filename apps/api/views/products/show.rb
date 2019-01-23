module Api
  module Views
    module Products
      class Show
        include Api::View
        layout false

        def serializer
          Serializers::ProductSerializer
        end

        def render
          _raw Hash[data: serializer.new(product).to_h].to_json
        end
      end
    end
  end
end
