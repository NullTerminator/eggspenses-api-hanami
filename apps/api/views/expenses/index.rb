module Api
  module Views
    module Expenses
      class Index
        include Api::View
        layout false

        def serializer
          Serializers::ExpenseSerializer
        end

        def render
          _raw Hash[data: expenses.map { |expense| serializer.new(expense).to_h }].to_json
        end
      end
    end
  end
end
