class SearchController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
  end
  
  def autocomplete
    Search.query
    render :nothing => true
  end
  
end
