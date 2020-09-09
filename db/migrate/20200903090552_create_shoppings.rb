class CreateShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppings do |t|
      t.references :user,             foreign_key: true 
      t.integer :item,                 null: false
      t.timestamps
    end
  end
end
