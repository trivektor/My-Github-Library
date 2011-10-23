require 'spec_helper'

describe SearchController do
  
  include Devise::TestHelpers

  describe "GET /autocomplete" do
    
    context "user is anonymous" do
      it "should respond with error" do
        get :autocomplete
        response.should_not be_success
      end
    end
    
    context "user is logged in" do
      it "should respond successfully" do
        user = Factory(:user, :username => 'trivektor', :email => 'trivektor@email.com', :password => 'abcd1234')
        sign_in(user)
        
        get :autocomplete
        response.should be_success
      end
    end
        
  end

end
