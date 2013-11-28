class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  belongs_to :city
  has_many :props, dependent: :destroy
	has_many :professions
  has_many :images

	mount_uploader :avatar, AvatarUploader

	validates :profile_name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2 }
	validates :name, presence: true, length: { minimum: 2 }

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.new(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20],
                           profile_name: SecureRandom.urlsafe_base64
                           )
      user.skip_confirmation!
      user.save
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.name = data["name"] if user.name.blank?
        user.gender = data["gender"].capitalize if user.gender.blank?
      end
    end
  end
end
