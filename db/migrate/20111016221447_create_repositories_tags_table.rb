class CreateRepositoriesTagsTable < ActiveRecord::Migration
  def up
    create_table :repositories_tags, :id => false do |t|
      t.integer :repository_id
      t.integer :tag_id
    end
    
    add_index :repositories_tags, :repository_id
    add_index :repositories_tags, :tag_id
  end

  def down
    drop_table :repositories_tags
  end
end
