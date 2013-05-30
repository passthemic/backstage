class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.integer :rap_id
      t.integer :user_id
      t.attachment :vocal_track

      t.timestamps
    end
    add_index :verses, :rap_id
    add_index :verses, :user_id
  end
end
