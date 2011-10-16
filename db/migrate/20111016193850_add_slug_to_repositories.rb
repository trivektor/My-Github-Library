class AddSlugToRepositories < ActiveRecord::Migration
  def up
    add_column :repositories, :slug, :string, :after => :name
    add_index :repositories, :slug, :unique => true
  end
  
  def down
    remove_column :repositories, :slug
  end
end
