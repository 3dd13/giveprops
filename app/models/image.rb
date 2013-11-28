class Image < ActiveRecord::Base
  belongs_to :user

  mount_uploader :portfolio_image, PortfolioImageUploader
end
