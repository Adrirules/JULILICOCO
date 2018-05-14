class Article < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :chapo, lenght: { minimun: 10 }
  validates :content, lenght: { minimun: 20}
end
