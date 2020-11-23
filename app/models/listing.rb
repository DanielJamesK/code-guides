class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :programming_language

  has_one_attached :picture, dependent: :purge
  
  validate :alphanum_description, :alphanum_title 
  validates :title, length: { in: 2..50 }, presence: true
  validates :description, length: { maximum: 250 }, presence: true
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 1000 }

  # Method the ensure the user only enters alphanumerical characters for their description
  def alphanum_description
    if description !~ /[[:alnum:]]/
      errors.add(:description, "can only contain letters or numbers")
    end
  end

  # Method the ensure the user only enters alphanumerical characters for their title
  def alphanum_title
    if title !~ /[[:alnum:]]/
      errors.add(:title, "can only contain letters or numbers")
    end
  end
end
