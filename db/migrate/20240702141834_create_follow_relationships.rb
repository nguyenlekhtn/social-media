class CreateFollowRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :follow_relationships do |t|
      t.references :follower, foreign_key: { to_table: :users }
      t.references :followed_user, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
