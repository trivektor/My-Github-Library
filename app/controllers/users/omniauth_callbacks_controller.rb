class Users::OmniauthCallbacksController < ApplicationController
  
  def github
    # You need to implement the method below in your model
    @user = User.find_for_github_oauth(env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in :user, @user
      redirect_to dashboard_url
    else
      redirect_to root_path
    end
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
  
end
