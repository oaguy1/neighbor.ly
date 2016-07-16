class FavorResponseSerializer < ActiveModel::Serializer
  attributes :id, :can_help_at, :comment

  belongs_to :favor
  belongs_to :user
end
