class Post < ApplicationRecord
  belongs_to :user
  # 4 #
validates :user_id, :description, presence: true
  # #
end
