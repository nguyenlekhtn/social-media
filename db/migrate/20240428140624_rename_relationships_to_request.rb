class RenameRelationshipsToRequest < ActiveRecord::Migration[7.1]
  def change
    rename_table :relationships, :requests
  end
end
