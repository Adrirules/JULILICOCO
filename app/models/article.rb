class Article < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :chapo, length: { minimum: 10 }
  validates :content, length: { minimum: 20}

  #photo with cloudinary and carrierwaves
  mount_uploader :photo, PhotoUploader

end
