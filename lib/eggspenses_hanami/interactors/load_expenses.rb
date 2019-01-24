require 'hanami/interactor'

class LoadExpenses
  include Hanami::Interactor

  expose :expenses

  def initialize(repo: ExpenseRepository.new)
    @repo = repo
  end

  def call(query={})
    from = query[:from_date]
    to = query[:to_date]

    @expenses = if from && to
      @repo.find_in_dates_with_expensable(from, to)
    elsif from
      @repo.find_after_date_with_expensable(from)
    elsif to
      @repo.find_before_date_with_expensable(to)
    else
      @repo.all_with_expensable
    end
  end

end
