class Location < ApplicationRecord
  validates :lat, presence: true
  validates :lon, presence: true

  reverse_geocoded_by :lat, :lon
  after_validation :reverse_geocode
end
