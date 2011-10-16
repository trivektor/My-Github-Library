class RepositoriesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def sync
    Repository.sync(current_user.username)
    render :nothing => true
  end
  
end
