class Course < ActiveRecord::Base
  belongs_to :tutor
  belongs_to :group
  belongs_to :subject
  has_many :marks
end
