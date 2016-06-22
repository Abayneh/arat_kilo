class User < ActiveRecord::Base
  has_many :messages
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
