class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :hash, :presence => true
  
  belongs_to :profile, :polymorphic => true, :dependent => :destroy
  has_and_belongs_to_many :groups
  
  def self.authenticate(login, password)
    user = User.find_by_username(login)
    if user != nil
      name = user.hash
    end
    if (user.hash == password)
      return user 
    end
  end
  
  def authenticated?(password)
    self.hash == password
  end
  
end
