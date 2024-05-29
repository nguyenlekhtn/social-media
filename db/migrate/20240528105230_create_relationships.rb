class CreateRelationships < ActiveRecord::Migration[7.1]
  def change
    drop_table :requests # rubocop:disable Rails/ReversibleMigration
    create_table :relationships do |t|
      t.references :follower, foreign_key: { to_table: :users }
      t.references :followed_user, foreign_key: { to_table: :users }
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
