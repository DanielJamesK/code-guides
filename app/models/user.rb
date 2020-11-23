class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings, dependent: :destroy
  has_many :programming_languages, dependent: :destroy

  validate :letters_only_first_name, :letters_only_last_name, :first_name_one_word, :last_name_one_word
  validates :first_name, length: { in: 2..25 }, presence: true
  validates :last_name, length: { in: 2..25 }, presence: true

  # Method to ensure the users first name is only 1 word
  def first_name_one_word
    if first_name.include? " "
      errors.add(:first_name, "cannot be more than 1 word")
    end
  end

  # Method to ensure the user only enters alpha characters for their first name
  def letters_only_first_name
    if first_name !~ /[[:alpha:]]/
      errors.add(:first_name, "can only contain letters")
    end
  end

  # Method to ensure the users lane name is only 1 word
  def letters_only_last_name
    if last_name !~ /[[:alpha:]]/
      errors.add(:last_name, "can only contain letters")
    end
  end

  # Method to ensure the user only enters alpha characters for their last name
  def last_name_one_word
    if last_name.include? " "
      errors.add(:last_name, "cannot be more than 1 word")
    end
  end
end
