class Prop < ActiveRecord::Base
  belongs_to :user
  belongs_to :profession
  belongs_to :rated_by_user, class_name: "User"

  validate :user_should_not_be_the_same_as_rated_by_user
  validate :user_should_only_be_rated_once_by_a_rated_by_user

  def user_should_not_be_the_same_as_rated_by_user
  	if user == rated_by_user
      errors.add(:user, "users cannot rate themselves")
    end
  end

  def user_should_only_be_rated_once_by_a_rated_by_user
  	# if rated_by_user and user exist already, cannot create a new rating
  		# errors.add(:rated_by_user, "a rated_by_user can only create a rating for a user once")
  	# end	
  end

  def self.all_professions_by_user_id(user_id)
    Prop.select("profession_id, avg(rating) as total, count(rating) as count").where(user_id: user_id).group(:profession_id)
  end

  def self.all_users_by_profession_id(profession_id)
    Prop.select("user_id, avg(rating) as total").where(profession_id: profession_id).group(:user_id)
  end
end
