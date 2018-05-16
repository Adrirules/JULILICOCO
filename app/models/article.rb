class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :chapo, length: { minimum: 10 }
  validates :content, length: { minimum: 20}

  #photo with cloudinary and carrierwaves
  mount_uploader :photo, PhotoUploader

  extend FriendlyId
    friendly_id :title, use: :slugged
end
