require 'net/http'

class Repository < ActiveRecord::Base
  
  def self.sync(user)
    request = Net::HTTP.get(URI.parse("http://github.com/api/v2/json/repos/watched/#{user.username}"))
    repos = JSON::parse(request)
    
    repos['repositories'].each do |r|
      Repository.create(
        :user_id => user.id,
        :name => r['name'],
        :description => r['description'],
        :owner => r['owner'],
        :homepage => r['homepage'],
        :language => r['language'],
        :watchers => r['watchers'],
        :has_downloads => r['has_downloads'],
        :url => r['url'],
        :fork => r['fork'],
        :size => r['size'],
        :has_wiki => r['has_wiki'],
        :forks => r['forks']
      )
    end
  end
  
end
