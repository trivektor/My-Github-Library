class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_page_number
  
  protected
  
  def get_page_number
    @page = params[:page].present? ? params[:page] : 1
  end
  
end
