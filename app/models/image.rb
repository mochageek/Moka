class Image < ApplicationRecord
  belongs_to :coffee
  mount_uploader :image, ImageUploader
end
