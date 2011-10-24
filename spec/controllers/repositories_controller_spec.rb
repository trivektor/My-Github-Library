require 'spec_helper'

describe RepositoriesController do
  
  include Devise::TestHelpers
  
  context "user is anonymous" do
    
  end
  
  context "user is logged in" do
    
    before(:each) do
      @user = Factory(:user, :username => 'trivektor', :email => 'trivektor@email.com', :password => 'abcd1234')
      sign_in(@user)
    end
    
    it "should respond to the autocomplete action" do
      get :autocomplete
      response.should be_success
    end
    
    it "should respond to the autocomplete action with some repositories if applicable" do
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
    
    describe "GET /repositories/:id/edit" do
      
      it "should render the edit form and applicable instance variables" do
        repo = Factory(:repository, :name => "rails", :description => "RoR Framework")
        get :edit, {:id => "rails"}
        response.should be_success
        assigns[:repository].should_not be_nil
        assigns[:repository].name.should == repo.name
        assigns[:repository].description.should == repo.description
        
        development_tag = Factory(:tag, :name => "development", :user_id => @user.id)
        development_tag.repositories << repo
        development_tag.save
        
        frameworks_tag = Factory(:tag, :name => "frameworks", :user_id => @user.id)
        frameworks_tag.repositories << repo
        frameworks_tag.save
        
        assigns[:tags].should_not be_nil development_tag
        assigns[:tags].should_not be_nil frameworks_tag
      end
      
    end
    
  end

end
