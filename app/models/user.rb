class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :city
  has_many :props, dependent: :destroy
	has_many :professions, through: :props

	mount_uploader :avatar, AvatarUploader

	validates :profile_name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2 }
	validates :name, presence: true, length: { minimum: 2 }
	validates :city, presence: true
end
