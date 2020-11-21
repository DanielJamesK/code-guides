class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :programming_language

  has_one_attached :picture
  
  validate :alphanum_description, :alphanum_title 
  validates :title, length: { in: 2..25 }, presence: true
  validates :description, length: { maximum: 250 }, presence: true
  validates :price, presence: true


  def alphanum_description
    if description !~ /[[:alnum:]]/
      errors.add(:description, "can only contain letters or numbers")
    end
  end

  def alphanum_title
    if title !~ /[[:alnum:]]/
      errors.add(:title, "can only contain letters or numbers")
    end
  end
end
