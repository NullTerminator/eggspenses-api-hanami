class AssetRepository < Hanami::Repository
  associations do
    has_many :products
  end

  def find_all(ids)
    assets.where(id: ids).to_a
  end

  def all_with_products
    aggregate(:products).map_to(Asset).to_a
  end

  def find_with_product(id)
    aggregate(:products).where(id: id).map_to(Asset).one
  end

  def create_with_products(data)
    assoc(:products).create(data)
  end
end
