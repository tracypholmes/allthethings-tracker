class AddCreatorToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_creator, :string
  end
end
