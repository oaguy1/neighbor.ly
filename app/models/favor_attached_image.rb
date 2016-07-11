class FavorAttachedImage < ApplicationRecord
  belongs_to :favor
  belongs_to :attached_image
end
