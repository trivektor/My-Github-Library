class Tag < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  has_and_belongs_to_many :repositories
  
  validates_presence_of :user_id, :name, :message => "is required"
  validates_uniqueness_of :name, :scope => :user_id
  
  scope :alphabetically_ordered, order("name ASC")
  
  def self.create(values)
    user = values[:user]
    tag = Tag.new(values[:tag])
    tag.user_id = user.id
    repository = values[:repository]
    
    if !Tag.exists?(:user_id => user.id, :name => values[:tag][:name])
      if tag.valid?
        tag.save
        tag.repositories << repository
        tag.save
      end
    else
      existing_tag = Tag.where(:user_id => user.id, :name => values[:tag][:name]).first
      unless existing_tag.repository_ids.include? repository.id
        existing_tag.repositories << repository
        existing_tag.save
      end
    end
    
  end
  
end
