class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :list_title
      t.integer :user_id
      t.integer :item_id
    end
  end
end
