module Api
  module Views
    module Expenses
      class Show
        include Api::View
        layout false

        def serializer
          Serializers::ExpenseSerializer
        end

        def render
          _raw Hash[data: serializer.new(expense).to_h].to_json
        end
      end
    end
  end
end
