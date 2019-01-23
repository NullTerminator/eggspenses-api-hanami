class ExpenseRepository < Hanami::Repository
  def all_with_expensable
    exps = all

    expensables = {}
    exps.group_by(&:expensable_type).each do |type, group|
      repo = Hanami.const_get("#{Hanami::Utils::String.classify(Hanami::Utils::String.singularize(type))}Repository").new
      expensables[type] = repo.find_all(group.map(&:expensable_id))
    end

    exps.map do |expense|
      Expense.new(expense.to_h.merge(expensable: expensables[expense.expensable_type].find { |e| e.id == expense.expensable_id }))
    end
  end
end
