require 'net/http'

class Repository < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  has_and_belongs_to_many :tags
  
  validates_uniqueness_of :name, :scope => :user_id
  
  def self.sync(user)
    (1..100).each do |i|
      request = Net::HTTP.get(URI.parse("http://github.com/api/v2/json/repos/watched/#{user.username}?page=#{i}"))
      repos = JSON::parse(request)
      
      break if repos['repositories'].count == 0
      
      rep = []

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

        rep << r if r.valid?
      end

      Repository.import rep
      
    end
  end
  
end
