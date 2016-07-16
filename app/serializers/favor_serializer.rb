class FavorSerializer < ActiveModel::Serializer
  attributes :id, :title, :message, :favor_type, :created_at, :updated_at

  has_one :location
  has_many :attached_images
  has_many :favor_responses
end
