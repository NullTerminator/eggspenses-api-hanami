require 'hanami/interactor'

class LoadAssetEvents
  include Hanami::Interactor

  expose :asset_events

  def initialize(repo: AssetEventRepository.new)
    @repo = repo
  end

  def call(query={})
    from = query[:from_date]
    to = query[:to_date]

    @asset_events = if from && to
      @repo.find_in_dates_with_assets(from, to)
    elsif from
      @repo.find_after_date_with_assets(from)
    elsif to
      @repo.find_before_date_with_assets(to)
    else
      @repo.all_with_assets
    end
  end

end
