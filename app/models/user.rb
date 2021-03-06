class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
   validates  :email, presence: true
   validates :email, uniqueness: true
   validates :username, presence: true 
   has_many :purchase, dependent: :destroy
  #  belongs_to :user
  #  has_secure_password
end
