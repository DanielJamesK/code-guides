class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings, dependent: :destroy
  has_many :programming_languages, dependent: :destroy

  validates :first_name, length: { in: 2..25 }, presence: true
  validates :last_name, length: { in: 2..25 }, presence: true
  validate :first_name_one_word, :last_name_one_word, :letters_only_first_name, :letters_only_last_name

  def first_name_one_word
    if first_name.include? " "
      errors.add(:first_name, "cannot be more than 1 word")
    end
  end

  def letters_only_first_name
    if first_name !~ /[[:alpha:]]/
      errors.add(:first_name, "can only contain letters")
    end
  end

  def letters_only_last_name
    if last_name !~ /[[:alpha:]]/
      errors.add(:last_name, "can only contain letters")
    end
  end

  def last_name_one_word
    if last_name.include? " "
      errors.add(:last_name, "cannot be more than 1 word")
    end
  end
end
