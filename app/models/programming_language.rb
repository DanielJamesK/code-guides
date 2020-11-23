class ProgrammingLanguage < ApplicationRecord
  belongs_to :user
  has_many :listings, dependent: :destroy

  has_one_attached :picture, dependent: :purge

  validate :prog_alphanum_description, :prog_alphanum_title 
  validates :name, length: { in: 2..25 }, presence: true
  validates :description, length: { maximum: 250 }, presence: true

  # Method the ensure the admin only enters alphanumerical characters for the programming language description
  def prog_alphanum_description
    if description !~ /[[:alnum:]]/
      errors.add(:description, "can only contain letters or numbers")
    end
  end

  # Method the ensure the admin only enters alphanumerical characters for the programming language title
  def prog_alphanum_title
    if name !~ /[[:alnum:]]/
      errors.add(:name, "can only contain letters or numbers")
    end
  end
end
