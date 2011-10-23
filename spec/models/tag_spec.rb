require 'spec_helper'

describe Tag do
  
  before(:each) do
    @user = Factory.create(:user, :username => "trivektor", :email => "trivektor@gmail.com")
  end
  
  it "should have a name" do
    tag = Tag.new
    tag.should_not be_valid
    tag.errors[:user_id].should include "is required"
    tag.errors[:name].should include "is required"
  end
  
  it "should have a slug after saved" do
    tag = Factory(:tag, :name => "ruby on rails", :user_id => @user.id)
    tag.slug.should_not be_nil
  end
  
  it "should create a tag for a user if that tag does not exist yet" do
    expect {
      Factory(:tag, :name => "ruby on rails", :user_id => @user.id)
      Factory(:tag, :name => "node js", :user_id => @user.id)
    }.to change {
      Tag.count
    }.by(2)
  end
  
  it "should not create a tag for a user if that tag already exists" do
    Factory(:tag, :name => "ruby on rails", :user_id => @user.id)
    tag = Tag.new(:name => "ruby on rails", :user_id => @user.id)
    tag.should_not be_valid
  end
  
end
