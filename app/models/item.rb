class Item < ApplicationRecord
  has_one_attached :image

  validates :product_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shopping_cost_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :shipping_id, numericality: { other_than: 0 , message: "can't be blank"}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/, message: 'は半角数字のみを入力してください' }
  validates :image, presence: true

  belongs_to :user
  has_one :order
  has_many :comments
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shopping_cost
  belongs_to :prefecture
  belongs_to :shipping

  
end
