module Api
  module Views
    module SaleItems
      class Index
        include Api::View
        layout false

        def serializer
          Serializers::SaleItemSerializer
        end

        def render
          _raw Hash[data: sale_items.map { |sale_item| serializer.new(sale_item).to_h }].to_json
        end
      end
    end
  end
end
