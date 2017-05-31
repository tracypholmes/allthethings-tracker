class List < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  # make sure all lists have unique names/titles
  validates :list_title, presence: true, uniqueness: true
end