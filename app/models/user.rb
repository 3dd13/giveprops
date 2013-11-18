class User < ActiveRecord::Base
	belongs_to :city
  has_many :props, dependent: :destroy
	has_many :professions, through: :props
end
