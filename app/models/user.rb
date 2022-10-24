class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,               presence: true
  validates :first_name,             presence: true
  validates :family_name,            presence: true 
  validates :first_name_kana,        presence: true
  validates :family_name_kana,       presence: true
  validates :birth_day,              presence: true

  has_many :items
  has_many :purchases

end