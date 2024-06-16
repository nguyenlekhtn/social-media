require_relative 'relationship'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sent_requests, foreign_key: 'requester_id', class_name: 'Relationship', dependent: :destroy,
                           inverse_of: :requester

  has_many :received_requests, foreign_key: 'requested_user_id', class_name: 'Relationship', dependent: :destroy,
                               inverse_of: :requested_user

  has_many :followers, through: :received_requests, source: :requester

  def following?(user)
    Request.where(user:, follower: self, status: 'A').any?
  end
end
