class TagsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
  end
  
  def create
    respond_to do |format|
      format.js do
        repository = Repository.find(params[:repository_id])
        Tag.create(:tag => params[:tag], :repository => repository, :user => current_user)          
        render :json => repository.tags
      end
      
      format.html do
        render :text => "404 Bad Request", :status => 404
      end
    end
  end
  
  def autocomplete
    respond_to do |format|
      format.js do
        render :nothing => true
      end
      
      format.html do
        render :text => "404 Action Not Found", :status => 404
      end
    end
  end
  
end
