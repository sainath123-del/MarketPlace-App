class Product < ApplicationRecord
    has_many :ratings, dependent: :destroy 
    # belongs_to :user
    belongs_to :brand
    has_one :purchase, dependent: :destroy
    has_many :product_orders, dependent: :destroy
    has_many :orders, through: :product_orders
    validates :name, :description, :price, presence: true  
    has_many_attached :images  
       

    def average_rating
        
        avg_rating = ratings.reduce(0) do |sum, rating|
            sum + rating.rating
        end 
        avg_rating /= ratings.length.to_f unless avg_rating.zero?
        avg_rating.round(2)
    
    end
    
  
end
