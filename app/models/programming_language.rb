class ProgrammingLanguage < ApplicationRecord
  belongs_to :user
  has_many :listings, dependent: :destroy

  has_one_attached :picture
end
