class Course < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :group
  has_many :marks
end
