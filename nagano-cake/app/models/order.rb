class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  validates :customer_id, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :postage, presence: true
  validates :billing_amount, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirmation: 1, working: 2, preparation: 3, shipped: 4}

end
