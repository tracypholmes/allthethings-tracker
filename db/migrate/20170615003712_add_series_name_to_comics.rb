class AddSeriesNameToComics < ActiveRecord::Migration
  def change
    add_column :comics, :series_name, :string
  end
end
