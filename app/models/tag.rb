class Tag < ApplicationRecord
    validates :name, presence: true
  has_many :coffee_tag_relations, dependent: :destroy
  has_many :coffees, through: :coffee_tag_relations, dependent: :destroy
end
