class CoursesController < ApplicationController
  
  def index
    respond_to do |format|
      format.html { render :index }
      format.json { }
    end
  end
  
  def create
    subjects = Subject.all
    json = '['
    first = true
    subjects.each do |s|
      json << '{ name: "' + s.name + '", description: "' + s.description + '", iconCls: "subject-icon",'+
      ' children:[{ name: "Практика" }, {name: "Лекция"}] }'
      if not first
        json << ','
      else
        first = false
      end
    end
    json << ']'
    render :text => json
  end
  
  def show
  end
  
  def update
  end

  def destroy
  end
  
end
