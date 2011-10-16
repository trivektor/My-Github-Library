class RepositoriesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def sync
    Repository.sync(current_user)
    render :nothing => true
  end
  
  def index
    respond_to do |format|
      format.html do
        @repositories = current_user.repositories
      end
      
      format.json do
        render :json => current_user.repositories
      end
      
      format.js do
        render :json => current_user.repositories
      end
    end
  end
  
end
