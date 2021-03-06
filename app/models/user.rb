class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  include Gravtastic
  gravtastic
         
  has_one :profile
  has_many :repositories
  has_many :tags

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  def self.find_for_github_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    
    if user = User.find_by_email(data['email'])
      user
    else       
      email = data['email']
      email = self.generate_email(data['login']) if email.blank?
      
      user = User.create(
        :username     => data['login'],
        :email        => email, 
        :password     => Devise.friendly_token[0,20],
      )
      
      user.create_profile({
        :name                 => data['name'],
        :bio                  => data['bio'],
        :company              => data['company'],
        :location             => data['location'],
        :public_repos         => data['public_repos'],
        :owned_private_repos  => data['owned_private_repos'],
        :public_gists         => data['public_gists'],
        :private_gists        => data['private_gists'],
        :following            => data['following'],
        :followers            => data['followers'],
        :blog                 => data['blog'],
        :github_url           => data['html_url']
      })
      
      user
    end
  end
  
  def self.generate_email(login)
    "github-#{login}@mgl305.com"
  end
  
end
