class User < ActiveRecord::Base
  has_many :messages
  has_many :comments
  has_many  :shops
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end