class Book < ActiveRecord::Base
  belongs_to :user
   mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validate :picture_size
 
  private
# 验证上传的图片大小
def picture_size
if picture.size > 5.megabytes
errors.add(:picture, "should be less than 5MB")
end
end
end
