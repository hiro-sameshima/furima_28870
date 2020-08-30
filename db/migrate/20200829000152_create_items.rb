class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false
      t.text :explanation,            null: false
      t.integer :price,               null: false
      t.references :user,             foreign_key: true, null: false
      t.integer :category_id,         null: false
      t.integer :condition_id,        null: false
      t.integer :delivery_id,         null: false
      t.integer :shipping_origin_id,  null: false
      t.integer :arrival_days_id,     null: false
      t.timestamps
    end
  end
end