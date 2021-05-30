class User < ApplicationRecord
    has_many :ratings, dependent: :destroy
    validates :name, :email, presence: true 
    enum status: ['admin','active','deactivated']
end
