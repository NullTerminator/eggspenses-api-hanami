class AssetEventRepository < Hanami::Repository
  associations do
    belongs_to :asset
  end

  def all_with_assets
    aggregate(:asset).map_to(AssetEvent).to_a
  end

  def find_in_dates_with_assets(from, to)
    #aggregate(:asset).where(date: from..to).map_to(AssetEvent).to_a
    # To be proper logic the above line is correct.  However, the Rails version of the app has a bug
    # where it checks with an OR so it returns all of the events everytime.  The front end currently
    # relies on that so it has any count for assets.  For now I'm mimicking that behavior.
    all_with_assets
  end

  def find_after_date_with_assets(from)
    aggregate(:asset).where { date >= from }.map_to(AssetEvent).to_a
  end

  def find_before_date_with_assets(to)
    aggregate(:asset).where { date <= to }.map_to(AssetEvent).to_a
  end
end
