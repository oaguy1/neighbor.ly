class AttachedImage < ApplicationRecord
  has_many :favor_attached_images
  has_many :favors, through: :favor_attached_images

  validates :url, presence: true
end
