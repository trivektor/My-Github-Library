class RepositoriesController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :find_repo, :only => [:edit, :update]
  
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
  
  def edit
  end
  
  def update
    if @repository.update_attributes(params[:repository])
      flash[:notice] = "Cool! Repo information has been updated"
      redirect_to :action => :edit
    else
      render :action => :edit
    end
  end
  
  private
  
  def find_repo
    @repository = Repository.find(params[:id])
  end
  
end
