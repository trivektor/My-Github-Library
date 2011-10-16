class CreateProfiles < ActiveRecord::Migration
  def up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :bio
      t.string :company
      t.string :location
      t.integer :public_repos
      t.integer :owned_private_repos
      t.integer :public_gists
      t.integer :private_gists
      t.integer :following
      t.integer :followers
      t.string  :blog
      t.string  :github_url
      t.timestamps
    end
  end
  
  def down
    drop_table :profiles
  end
end
