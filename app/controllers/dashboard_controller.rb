class DashboardController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    redirect_to repositories_path
  end
  
end
