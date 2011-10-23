class AddRepositoryIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :repository_id, :integer
  end
end
