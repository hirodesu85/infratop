class Address < ApplicationRecord
  belongs_to :customer
  
  validates :customer_id, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true

end
