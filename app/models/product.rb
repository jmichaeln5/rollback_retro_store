class Product < ApplicationRecord
  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true, greater_than: 0}
  has_many :reviews
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }, default_url: "/images/:style/missing.png"
  validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }


  def formatted_price
  price_in_dollars = price_in_cents.to_f / 100
  sprintf("%.2f", price_in_dollars)
  end

end
