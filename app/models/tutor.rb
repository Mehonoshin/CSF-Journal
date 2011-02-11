class Tutor < ActiveRecord::Base
  belongs_to :user
  has_many :marks
  has_many :courses
end
