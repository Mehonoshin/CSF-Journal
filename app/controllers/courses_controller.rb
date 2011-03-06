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
          json << 
          '{ 
            id: ' + s.id.to_s + 
            ', name: "' + s.name + 
            '", description: "' + s.description + 
            '", iconCls: "subject-icon", 
            type: "subject"'
          if s.courses.empty?
            json << ', leaf: "true"'
          else
            json << ', children: ['
            s.courses.each do |c|
              json << '{ name: "' + s.name + '", description: "' + c.group.description + '", iconCls: "group-icon", leaf: "true" }'
            end
            json << ']'
          end          
          json << ' }'
        end
        json << ']'
        render :text => json
      }
    end
  end
  
  def create
    c = Course.create(:group_id => params[:group], :tutor_id => params[:tutor], :subject_id => params[:subject])
    render :text => c.id.to_s
  end
  
  def show
  end
  
  def update
  end

  def destroy
    render :text => ""
  end
  
end
