class Tutor < ActiveRecord::Base
  # belongs_to :user
  has_one :user, :as => :profile, :dependent => :destroy
  has_many :marks
  has_many :courses
end
