class CreateSubforums < ActiveRecord::Migration
  def self.up
    create_table :subforums do |t|
      t.string :title
      t.text :description
      t.integer :is_private

    end
  end

  def self.down
    drop_table :subforums
  end
end
