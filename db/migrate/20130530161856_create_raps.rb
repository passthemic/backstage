class CreateRaps < ActiveRecord::Migration
  def change
    create_table :raps do |t|
      t.integer :user_id
      t.integer :friend_id
      t.attachment :final_cut

      t.timestamps
    end
    add_index :raps, :user_id
    add_index :raps, :friend_id
  end
end
