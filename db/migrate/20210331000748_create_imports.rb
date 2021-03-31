class CreateImports < ActiveRecord::Migration[6.0]
  def change
    create_table :imports do |t|
      t.string :buyer
      t.string :description
      t.decimal :unit_price
      t.integer :quantity
      t.string :address
      t.string :supplier

      t.timestamps
    end
  end
end
