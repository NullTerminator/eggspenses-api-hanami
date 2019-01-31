class ProductRepository < Hanami::Repository
  associations do
    belongs_to :asset
  end

  def find_by_name(name)
    assets.where(name: name).one
  end

  def find_with_asset(id)
    aggregate(:asset).where(id: id).map_to(Product).one
  end

  def all_with_assets
    aggregate(:asset).map_to(Product).to_a
  end
end
