class CoursesController < ApplicationController
  
  def index
    respond_to do |format|
      format.html { render :index }
      format.json { 
        subjects = Subject.all
        json = '['
        first = true
        subjects.each do |s|
          if not first
            json << ','
          else
            first = false
          end
          json << '{ id: ' + s.id.to_s + ', name: "' + s.name + '", description: "' + s.description + '", iconCls: "subject-icon", type: "subject"'
          json << ' }'
        end
        json << ']'
        render :text => json
      }
    end
  end
  
  def create
  end
  
  def show
  end
  
  def update
  end

  def destroy
    render :text => ""
  end
  
end
