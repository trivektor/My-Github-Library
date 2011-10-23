class Tag < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  has_and_belongs_to_many :repositories
  
  validates_presence_of :user_id, :name, :message => "is required"
  validates_uniqueness_of :name, :scope => :user_id
  
  def self.create(values, user)
    
  end
  
end
