class TagsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
  end
  
  def create
    respond_to do |format|
      format.js do
        repository = Repository.find(params[:repository_id])
        
        begin
          
          tag = Tag.new(params[:tag])
          tag.user_id = current_user.id
          
          if !Tag.exists?(:user_id => current_user.id, :name => params[:tag][:name])
            if tag.valid?
              tag.save
              tag.repositories << repository
              tag.save
            end
          else
            existing_tag = Tag.where(:user_id => current_user.id, :name => params[:tag][:name]).first
            existing_tag.repositories << repository
            existing_tag.save
          end
          
          render :json => repository.tags
        rescue
          render :json => repository.tags
        end
        
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
