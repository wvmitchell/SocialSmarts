class User < ActiveRecord::Base
  has_many :mentions

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.image = auth["info"]["image"]
      user.nickname = auth["info"]["nickname"]
      user.location = auth["info"]["location"]
      user.access_token = auth["extra"]["access_token"].token
      user.access_secret = auth["extra"]["access_token"].secret
    end
  end
end
