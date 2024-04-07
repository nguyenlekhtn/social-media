class AddUniqueIndexUserIdFollowerIdToRelationships < ActiveRecord::Migration[7.1]
  def change
    add_index :relationships, [:user_id, :follower_id], unique: true
  end
end
