module Api
  module Views
    module SaleItems
      class Show
        include Api::View
        layout false

        def serializer
          Serializers::SaleItemSerializer
        end

        def render
          _raw Hash[data: serializer.new(sale_item).to_h].to_json
        end
      end
    end
  end
end
