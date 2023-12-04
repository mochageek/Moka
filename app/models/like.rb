class Like < ApplicationRecord
  belongs_to :coffee
  belongs_to :user
  validates_uniqueness_of :coffee_id, scope: :user_id
end
