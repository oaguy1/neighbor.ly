class FavorResponse < ApplicationRecord
  belongs_to :favor
  belongs_to :user

  validates_presence_of :favor_id, :user_id, :can_help_at
end
