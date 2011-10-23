class CreateTags < ActiveRecord::Migration
  def up
    create_table :tags do |t|
      t.integer :user_id
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
  
  def down
    drop_table :tags
  end
end
