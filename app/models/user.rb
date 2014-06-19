class User < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  has_many :bets
  has_many :match_comments
  
  has_many :profile_commentors, class_name: "ProfileComment", foreign_key: "profile_commentor_id" #, dependent: :destroy
  has_many :profile_commentees, class_name: "ProfileComment", foreign_key: "profile_commentee_id" #, dependent: :destroy  

  has_many :followers, class_name: "Following", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, class_name: "Following", foreign_key: "followed_id", dependent: :destroy
  
end
