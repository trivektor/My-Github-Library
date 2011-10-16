class CreateRepositoriesTagsTable < ActiveRecord::Migration
  def up
    create_table :repositories_tag do |t|
      t.integer :repository_id
      t.integer :tag_id
    end
    
    add_index :repositories_tag, :repository_id
    add_index :repositories_tag, :tag_id
  end

  def down
    drop_table :repositories_tag
  end
end
