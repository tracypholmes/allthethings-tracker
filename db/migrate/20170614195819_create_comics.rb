class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.string :creator
      t.string :publisher
      t.datetime :published_date
      t.integer :issue
      t.string :media_type
      t.integer :user_id
    end
  end
end
