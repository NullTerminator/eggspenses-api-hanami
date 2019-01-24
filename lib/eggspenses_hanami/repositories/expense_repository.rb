class ExpenseRepository < Hanami::Repository
  def all_with_expensable
    map_expensables(all)
  end

  def find_with_expensable(id)
    map_expensables(expenses.where(id: id).to_a).first
  end

  def all_for_expensable_type(type)
    map_expensables expenses.where(expensable_type: type).to_a
  end

  def find_in_dates_with_expensable(from, to)
    map_expensables(before_date(after_date(expenses, from), to).to_a)
  end

  def find_after_date_with_expensable(from)
    map_expensables after_date(expenses, from).to_a
  end

  def find_before_date_with_expensable(to)
    map_expensables before_date(expenses, to).to_a
  end

  private

  def after_date(relation, from)
    relation.where { (end_date >= from) | end_date.is(nil) }
  end

  def before_date(relation, to)
    relation.where { (start_date >= to) | start_date.is(nil) }
  end

  def map_expensables(exps)
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
