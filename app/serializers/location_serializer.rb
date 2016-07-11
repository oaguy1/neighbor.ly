class LocationSerializer < ActiveModel::Serializer
  attributes :lat, :lon, :address
end
