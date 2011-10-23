require 'spec_helper'

describe RepositoriesController do
  
  include Devise::TestHelpers
  
  context "user is anonymous" do
    
  end
  
  context "user is logged in" do
    
    before(:each) do
      @user = Factory(:user, :username => 'trivektor', :email => 'trivektor@email.com', :password => 'abcd1234')
    end
    
    it "should respond to the autocomplete action" do
      sign_in(@user)
      get :autocomplete
      response.should be_success
    end
    
    it "should respond to the autocomplete action with some repositories if applicable" do
      sign_in(@user)
      
      Factory(:repository, :name => "rails", :description => "Ruby on Rails framework")
      Factory(:repository, :name => "rspec-rails", :description => "Rspec for Rails")
      Factory(:repository, :name => "breadcrum_on_rails", :description => "Breadcrum plugin for Rails")
      
      get :autocomplete, {:query => "rails"}
      response.should be_success
      
      r = JSON.parse(response.body)
      r['query'].should_not be_blank
      r['query'].should == "rails"
      r['suggestions'].should_not be_empty
      r['suggestions'].should have(3).items
    end
    
  end

end
