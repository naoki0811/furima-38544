class OrderDestination
  include ActiveModel::Model
  attr_accessor :post_code , :prefecture_id, :city, :address, :build, :phone_number, :user_id, :item_id, :order_id, :token
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/ }
    validates :token
  end
 
  def save
    order =Order.create(item_id: item_id, user_id: user_id)

    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, build: build, phone_number: phone_number, order_id: order.id)
    
  end
end