class MarksController < ApplicationController
  
  def index
    respond_to do |format|
      format.html { 
        @courses = Course.all
      }
    end
  end
  
end
