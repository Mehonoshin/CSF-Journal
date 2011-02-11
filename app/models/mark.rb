class Mark < ActiveRecord::Base
  belongs_to :student
  belongs_to :tutor
  belongs_to :course
end
