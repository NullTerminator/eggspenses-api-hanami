class SaleItemRepository < Hanami::Repository
  associations do
    belongs_to :product
  end

  def find_all(ids)
    sale_items.where(id: ids).to_a
  end

  def find_with_product_and_expenses(id)
    populate_expenses(aggregate(:product).where(id: id).map_to(SaleItem).to_a).first
  end

  def all_with_product_and_expenses
    populate_expenses aggregate(:product).map_to(SaleItem).to_a
  end

  private

  def populate_expenses(items)
    expenses = ExpenseRepository.new.all_for_expensable_type('sale_items')

    items.map do |sale_item|
      SaleItem.new(sale_item.to_h.merge(expenses: expenses.select { |e| sale_item.id == e.expensable_id }))
    end
  end
end
