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
      user.location = auth["extra"]["access_token"].token
      user.location = auth["extra"]["access_token"].secret
    end
  end
end
