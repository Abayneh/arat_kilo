class User < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many  :shops, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   
  # def find_user(shops)
  #   users = User.shops
  #   @user_email = []
  #   users.each do |user|
  #     @user_email << user.email
  #   end
  # end
         
end