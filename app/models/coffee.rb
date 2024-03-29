class Coffee < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    has_many :coffee_tag_relations, dependent: :destroy
    has_many :tags, through: :coffee_tag_relations, dependent: :destroy
    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images
end
