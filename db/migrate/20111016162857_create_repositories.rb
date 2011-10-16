class CreateRepositories < ActiveRecord::Migration
  def up
    create_table :repositories do |t|
      t.integer :user_id
      t.string :name
      t.text  :description
      t.text  :personal_description
      t.string :owner
      t.boolean :has_wiki
      t.datetime :created_date
      t.integer :forks
      t.string :homepage
      t.string :language
      t.integer :watchers
      t.datetime :pushed_at
      t.boolean :has_downloads
      t.string :url
      t.boolean :fork
      t.integer :size
      t.boolean :private
      t.timestamps
    end
  end
  
  def down
    drop_table :repositories
  end
end
