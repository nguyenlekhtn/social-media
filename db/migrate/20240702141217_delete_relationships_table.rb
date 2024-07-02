class DeleteRelationshipsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :relationships # rubocop:disable Rails/ReversibleMigration
  end
end
