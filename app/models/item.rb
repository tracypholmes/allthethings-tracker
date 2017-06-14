class Item < ActiveRecord::Base
  belongs_to :lists
  belongs_to :users
end