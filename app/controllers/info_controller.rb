class InfoController < ApplicationController
  def tutors
    @tutors = Tutor.order("position DESC")
  end
  
  def students
    @studGroups = Group.find(69).groups
  end
end
