require_relative 'request'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_requests, foreign_key: 'requester_id', class_name: 'Request', dependent: :destroy,
                           inverse_of: :requester

  has_many :received_requests, foreign_key: 'requested_user_id', class_name: 'Request', dependent: :destroy,
                               inverse_of: :requested_user

  has_many :relationship_as_follower, foreign_key: 'follower_id', class_name: 'FollowRelationship',
                                      dependent: :destroy, inverse_of: :follower

  has_many :relationship_as_followed, foreign_key: 'follower_id', class_name: 'FollowRelationship',
                                      dependent: :destroy, inverse_of: :followed_user

  has_many :followers, through: :relationship_as_followed, source: :follower
  has_many :followed_users, through: :relationship_as_follower, source: :followed_user
end
