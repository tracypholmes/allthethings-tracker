class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_type
      t.string :item_name
      t.integer :quantity
    end
  end
end
