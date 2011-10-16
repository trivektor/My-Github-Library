class Repository < ActiveRecord::Base
  
  def self.sync(username)
    request = Net::HTTP.get(URI.parse("http://github.com/api/v2/yaml/repos/watched/#{username}"))
    repos = YAML::load(request)["repositories"]
  end
  
end
