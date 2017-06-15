class Comic < ActiveRecord::Base
  belongs_to :users

  # make sure all comic have unique names/titles
  validates :title, presence: true, uniqueness: true
end