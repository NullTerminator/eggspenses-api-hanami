module Api
  module Controllers
    module Expenses
      class Index
        include Api::Action
        accept :json

        expose :expenses

        def initialize(interactor: LoadExpenses.new)
          @interactor = interactor
        end

        def call(params)
          @expenses = @interactor.call(params.to_h.select { |k, v| [:from_date, :to_date].include?(k) }).expenses
        end
      end
    end
  end
end
