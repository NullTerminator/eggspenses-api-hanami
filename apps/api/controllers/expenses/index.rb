module Api
  module Controllers
    module Expenses
      class Index
        include Api::Action
        accept :json

        expose :expenses

        def initialize(repo: ExpenseRepository.new)
          @repo = repo
        end

        def call(params)
          @expenses = @repo.all_with_expensable
        end
      end
    end
  end
end
