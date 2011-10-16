require 'net/http'

class Repository < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  validates_uniqueness_of :name
  
  def self.sync(user)
    request = Net::HTTP.get(URI.parse("http://github.com/api/v2/json/repos/watched/#{user.username}"))
    repos = JSON::parse(request)
    
    repositories = []
    
    repos['repositories'].each do |repo|
      r = Repository.new(
        :user_id => user.id,
        :name => repo['name'],
        :description => repo['description'],
        :owner => repo['owner'],
        :homepage => repo['homepage'],
        :language => repo['language'],
        :watchers => repo['watchers'],
        :has_downloads => repo['has_downloads'],
        :url => repo['url'],
        :fork => repo['fork'],
        :size => repo['size'],
        :has_wiki => repo['has_wiki'],
        :forks => repo['forks']
      )
      repositories << r if r.valid?
    end
    
    Repository.import repositories
  end
  
end
