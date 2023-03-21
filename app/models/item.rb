class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :is_sold, inclusion: { in: [true, false] }
  
  
  def add_tax
    (self.price * 1.10).round
  end
  
end


