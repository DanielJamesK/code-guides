class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :programming_language

  has_one_attached :picture
end
