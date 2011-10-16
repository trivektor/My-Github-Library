class DashboardController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    #@repos = Net::HTTP.get(URI.parse("http://github.com/api/v2/yaml/repos/watched/#{current_user.username}"))
  end
  
end
