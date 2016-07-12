class Item < ActiveRecord::Base
  belongs_to :shop
  belongs_to :categories
  
  validate :picture_size 
  mount_uploader :picture, PictureUploader
  
  private
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "Should be less than 5MB")
    end
  end
  
end