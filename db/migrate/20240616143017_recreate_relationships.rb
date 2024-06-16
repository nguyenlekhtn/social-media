class RecreateRelationships < ActiveRecord::Migration[7.1]
  def change
    drop_table :relationships # rubocop:disable Rails/ReversibleMigration
    create_table :relationships, primary_key: %i[requester_id requested_user_id] do |t|
      t.references :requester, foreign_key: { to_table: :users }
      t.references :requested_user, foreign_key: { to_table: :users }
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
