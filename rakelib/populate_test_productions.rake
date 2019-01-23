namespace :productions do
  desc 'Populate test productions for the past 90 days'
  task populate_test: :environment do

    return if Hanami.env?(:production)

    r = ProductionRepository.new
    d = Date.today
    products = ProductRepository.new.all

    (0..90).each do |i|
      products.each do |p|
        r.create(count: rand(20) + 60, date: d - i, product_id: p.id)
      end
    end

  end
end
