class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests, primary_key: %i[requester_id requested_user_id] do |t|
      t.references :requester, foreign_key: { to_table: :users }
      t.references :requested_user, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
