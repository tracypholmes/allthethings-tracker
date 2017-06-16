class Comic < ActiveRecord::Base
  belongs_to :users

  # make sure all comic have unique names/titles
  validates :title, presence: true, uniqueness: true
  validates :creator, :publisher, :issue, :media_type, :series_name, :published_date, presence: true
end