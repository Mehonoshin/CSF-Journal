class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :hash, :presence => true
  
  has_one :student
  has_one :tutor
  
  has_and_belongs_to_many :groups
end
