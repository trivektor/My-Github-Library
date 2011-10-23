class TagsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
  end
  
  def create
    respond_to do |format|
      format.js do
        begin
          tag = Tag.new(params[:tag])
          tag.user_id = current_user.id
          if tag.valid?
            tag.save
          end
        rescue
        end
        render :json => {:tags => current_user.tags}
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
