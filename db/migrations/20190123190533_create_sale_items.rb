Hanami::Model.migration do
  change do
    create_table :sale_items do
      primary_key :id

      column :name, String, null: false
      column :price, Float, null: false
      column :product_count, Integer, null: false

      foreign_key :product_id, :products, on_delete: :cascade, null: :false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
