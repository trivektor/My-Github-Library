class TagsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @tags = current_user.tags.alphabetically_ordered
  end
  
  def create
    respond_to do |format|
      format.json do
        repository = Repository.find(params[:repository_id])
        Tag.create(:tag => params[:tag], :repository => repository, :user => current_user)          
        render :json => {:success => 1, :repository => repository.tags.alphabetically_ordered.each { |t| t.repository_id = repository.id } }
      end
      
      format.html do
        render :text => "404 Bad Request", :status => 404
      end
    end
  end
  
  def destroy
    repository = Repository.find(params[:repository_id])
    tag = Tag.find(params[:id])
    repository.tags.delete(tag)
    render :json => {:success => 1, :repository => repository.tags.alphabetically_ordered.each { |t| t.repository_id = repository.id } }
  end
  
  def show
    @tag = Tag.find(params[:id])
    @repositories = @tag.repositories
  end
  
  def autocomplete
    respond_to do |format|
      format.json do
        render :nothing => true
      end
      
      format.html do
        render :text => "404 Action Not Found", :status => 404
      end
    end
  end
  
end
