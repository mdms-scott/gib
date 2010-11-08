class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :subforum_id
      t.integer :view_count
      t.integer :reply_count

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
