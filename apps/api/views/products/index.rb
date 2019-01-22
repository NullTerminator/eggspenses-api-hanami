module Api
  module Views
    module Products
      class Index
        include Api::View
        layout false

        def serializer
          Serializers::ProductSerializer
        end

        def render
          _raw Hash[data: products.map { |product| serializer.new(product).to_h }].to_json
        end
      end
    end
  end
end
