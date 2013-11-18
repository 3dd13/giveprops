class Profession < ActiveRecord::Base
	has_many :props, dependent: :destroy
	has_many :users, through: :props
end
