class FavorLocation < ApplicationRecord
  belongs_to :favor
  belongs_to :location
end
