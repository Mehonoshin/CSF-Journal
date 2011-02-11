class Group < ActiveRecord::Base
  validates :description, :presence => true
  
  belongs_to :group
  has_many :groups
  has_and_belongs_to_many :users
end
