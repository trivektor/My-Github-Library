require 'spec_helper'

describe TagsController do
  
  include Devise::TestHelpers
  
  context "user is anonymous" do
    
    specify "access to autocomplete action should render an error" do
      xhr :get, :autocomplete
      response.should_not be_success
    end
    
  end
  
  context "user is logged in" do
    
    before(:each) do
      @user = Factory(:user, :username => 'trivektor', :email => 'trivektor@email.com', :password => 'abcd1234')
      sign_in(@user)
    end
    
    it "should raise error when the autocomplete action is accessed via get" do
      get :autocomplete
      response.status.should == 404
      response.body.should == "404 Action Not Found"
    end
    
    it "should respond successfully to autocomplete action via ajax" do
      xhr :get, :autocomplete
      response.should be_success
    end
    
    it "should not respond to the create action via browser GET request" do
      post :create
      response.status.should == 404
      response.body.should == "404 Bad Request"
    end
    
    it "should respond to the create action successfully via ajax" do      
      expect {
        xhr :post, :create
      }.to change {
        Tag.count
      }.by(0)
      
      xhr :post, :create, {:tag => {:name => "ruby on rails"}}
    end
    
    it "should create a new tag if that tag does not exist yet" do
      expect {
        xhr :post, :create, {:tag => {:name => "ruby on rails"}}
      }.to change {
        Tag.count
      }.by(1)
    end
    
    it "should create a tag and its corresponding repository associaton if that tag does not exist" do
      repo = Factory(:repository, :user_id => @user.id, :name => "rails")
      xhr :post, :create, {:tag => {:name => "rails"}, :repository_id => repo.id}
      
      rails_tag = @user.tags.where(:name => "rails").first
      rails_tag.repositories.should_not be_nil
      rails_tag.repositories.should include repo
    end
    
    it "should not create a tag if that tag already exists" do
      Factory(:tag, :name => "ruby on rails", :user_id => @user.id)
      expect {
        xhr :post, :create, {:tag => {:name => "ruby on rails"}}
      }.to change {
        Tag.count
      }.by(0)
    end
        
    it "should return a collection of tags of the current user after create" do
      ["ruby", "php", "java", "objective-c"].each { |lang| Factory(:tag, :name => lang, :user_id => @user.id) }
      xhr :post, :create, {:tag => {:name => "javascript"}}
      r = JSON.parse(response.body)
      r.should have(5).items
    end
    
  end

end
