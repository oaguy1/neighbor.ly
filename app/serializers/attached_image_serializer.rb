class AttachedImageSerializer < ActiveModel::Serializer
  attributes :url, :caption, :created_at
end
