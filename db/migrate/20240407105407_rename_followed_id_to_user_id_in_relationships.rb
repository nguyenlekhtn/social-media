class RenameFollowedIdToUserIdInRelationships < ActiveRecord::Migration[7.1]
  def change
    change_table :relationships do |t|
      t.remove_references :followed, foreign_key: { to_table: :users }
    end

  add_reference :relationships, :user, foreign_key: true

  end
end
