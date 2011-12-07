require 'spec_helper'

describe HomeController do
  
  include Devise::TestHelpers
  
  context "user is anonymous" do
    
    it "should render the home page"
      get :index
      response.should_not be_success
    end
    
  end
  
  context "user is logged in" do
    
    it "should redirect to dashboard" do
      user = Factory(:user, :username => 'trivektor', :email => 'trivektor@email.com', :password => 'abcd1234')
      sign_in(user)
      
      get :index
      response.status.should == 302
      response.should redirect_to dashboard_path 
    end
    
  end
  
end