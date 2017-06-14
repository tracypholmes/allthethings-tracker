class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_type
      t.string :item_name
      t.string :creator
      t.integer :quantity
      t.integer :list_id
    end
  end
end
