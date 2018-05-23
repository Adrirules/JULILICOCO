class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :chapo, length: { minimum: 10, maximum: 500}
  validates :content, length: { minimum: 20}

  # photo with cloudinary and carrierwaves
  mount_uploader :photo, PhotoUploader

  # Elestic Search
  searchkick language: "french"

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  # acts_as_taggable_on :skills, :interests

  # has_many :tag_taggings, class_name: 'ActsAsTaggableOn::Tagging'
  # has_many :tags, class_name: 'ActsAsTaggableOn::Tag'

  extend FriendlyId
    friendly_id :title, use: :slugged
end
