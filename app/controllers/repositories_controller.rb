class RepositoriesController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :find_repo, :only => [:edit, :update, :show]
  
  def sync
    Repository.sync(current_user)
    render :nothing => true
  end
  
  def index
    respond_to do |format|
      format.html do
        @repositories = current_user.repositories.paginate(:per_page => 120, :page => @page)
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
    @tags = @repository.tags.alphabetically_ordered
  end
  
  def update
    if @repository.update_attributes(params[:repository])
      flash[:notice] = "Cool! Repo details have been updated"
      redirect_to :action => :edit
    else
      render :action => :edit
    end
  end
  
  def show
  end
  
  def autocomplete
    repositories = Repository.where("name LIKE ?", "%#{params[:query]}%")
    render :json => {:query => params[:query], :suggestions => repositories.map(&:name), :data => repositories.map(&:slug)}
  end
  
  private
  
  def find_repo
    @repository = Repository.find(params[:id])
  end
  
end
