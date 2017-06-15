class List < ActiveRecord::Base
  belongs_to :users
  has_many :items

  # make sure all lists have unique names/titles
  validates :list_title, presence: true, uniqueness: true
end