class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :chapo, length: { minimum: 10, maximum: 500}
  validates :content, length: { minimum: 20}

  # photo with cloudinary and carrierwaves
  mount_uploader :photo, PhotoUploader

  # Elestic Search
  searchkick language: "french"

  # searchkick settings: {blocks: {read_only: false}}

  extend FriendlyId
    friendly_id :title, use: :slugged
end
