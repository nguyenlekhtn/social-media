require_relative 'request'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :received_requests, class_name: 'Request', dependent: :destroy,
                               inverse_of: :follower
  has_many :sent_requests, foreign_key: 'follower_id', class_name: 'Request', dependent: :destroy,
                           inverse_of: :user
  has_many :followers, through: :follower_requests, class_name: 'User'
  has_many :following, through: :following_requests, source: :user, class_name: 'User'

  def following?(user)
    Request.where(user:, follower: self, status: 'A').any?
  end
end
