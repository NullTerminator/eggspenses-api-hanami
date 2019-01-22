class ProductRepository < Hanami::Repository
  associations do
    belongs_to :asset
  end

  def all_with_assets
    aggregate(:asset).map_to(Product).to_a
  end
end
