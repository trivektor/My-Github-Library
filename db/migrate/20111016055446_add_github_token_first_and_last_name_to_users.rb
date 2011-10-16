class AddGithubTokenFirstAndLastNameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :github_token, :string
  end
  
  def down
    remove_column :users, :github_token
  end
end
