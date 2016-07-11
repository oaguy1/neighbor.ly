class Favor < ApplicationRecord
  belongs_to :user

  has_one :favor_location
  has_one :location, through: :favor_location

  has_many :favor_attached_images
  has_many :attached_images, through: :favor_attached_images

  validates :title, presence: true
  validates :favor_type, presence: true, inclusion: %w"moving cooking cleaning borrow small\ gift"
end
