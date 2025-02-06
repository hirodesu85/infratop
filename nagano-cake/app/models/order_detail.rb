class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :price, presence: true
  validates :amount, presence: true
  validates :product_status, presence: true
  
  enum product_status: { impossible: 0, waiting: 1, working: 2, completed: 3 }
  
end
