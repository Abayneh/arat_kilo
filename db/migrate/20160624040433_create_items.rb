class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.boolean :discount
      t.boolean :soldout

      t.timestamps null: false
    end
  end
end
