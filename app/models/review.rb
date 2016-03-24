class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates_presence_of :rating, :user, :product
  validates_inclusion_of :rating, in: 1..5
end
