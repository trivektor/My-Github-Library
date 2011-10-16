class Users::OmniauthCallbacksController < ApplicationController
  
  def github
    # You need to implement the method below in your model
    @user = User.find_for_github_oauth(env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
      #sign_in_and_redirect @user, :event => :authentication
      sign_in :user, @user
      redirect_to dashboard_url
    else
      #Probably the line below will cause cookie overflow issue
      #session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_path
    end
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
  
end
