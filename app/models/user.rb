class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings, dependent: :destroy
  has_many :programming_languages, dependent: :destroy

  validate :first_name_one_word, :last_name_one_word, :letters_only

  def first_name_one_word
    if first_name.include? " "
      errors.add(:first_name, "cannot be more than 1 word")
    end
  end

  def letters_only
    if first_name !~ /\A[a-zA-Z]\z/
      errors.add(:first_name, "Invalid characters, First Name can only contain letters")
    end
  end

  def last_name_one_word
    if last_name.include? " "
      errors.add(:last_name, "cannot be more than 1 word")
    end
  end
end
