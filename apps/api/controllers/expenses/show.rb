module Api
  module Controllers
    module Expenses
      class Show
        include Api::Action
        accept :json

        expose :expense

        def initialize(repo: ExpenseRepository.new)
          @repo = repo
        end

        def call(params)
          @expense = @repo.find_with_expensable(params[:id])
        end
      end
    end
  end
end
