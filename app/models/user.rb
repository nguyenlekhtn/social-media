require_relative 'relationship'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follower_relationships, class_name: 'Relationship', dependent: :destroy,
                                    inverse_of: :follower
  has_many :following_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy,
                                     inverse_of: :user
  has_many :followers, through: :follower_relationships, class_name: 'User'
  has_many :following, through: :following_relationships, source: :user, class_name: 'User'

  def following?(user)
    Relationship.where(user:, follower: self, status: 'A').any?
  end
end
