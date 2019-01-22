class ProductionRepository < Hanami::Repository
  associations do
    belongs_to :product
  end

  def all_with_products
    aggregate(:product).map_to(Production).to_a
  end

  def find_in_dates_with_products(from, to)
    aggregate(:product).where(date: from..to).map_to(Production).to_a
  end

  def find_after_date_with_products(from)
    aggregate(:product).where { date >= from }.map_to(Production).to_a
  end

  def find_before_date_with_products(to)
    aggregate(:product).where { date <= to }.map_to(Production).to_a
  end
end
