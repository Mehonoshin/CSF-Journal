class TutorsController < ApplicationController
  
  def index
    respond_to do |format|
      format.html { render :text => ""}
      format.json {
        json = '{ rows: ['
        first = true 
        Tutor.all.each do |t|
          if not first
            json << ','
          else
            first = false
          end
          json << '{ "id":"' + t.id.to_s + '", "name":"' + t.name + '" }'
        end
        json << ']}'
        render :text => json
      }      
    end
  end
  
  def show
    @tutor = Tutor.find(params[:id])
  end
end
