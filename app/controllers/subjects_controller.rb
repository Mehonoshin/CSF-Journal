class SubjectsController < ApplicationController

  def index
  end

  def create
    if params[:name] == nil
    else
      s = Subject.create(:name => params[:name], :description => params[:desc])
      render :json => s.id
    end
  end
  
  def show
  end
  
  def destroy
    if params[:id]
      Subject.find(params[:id]).destroy
    end
    render :text => ""
  end
  
  def update
    if params[:name] && params[:desc]
      s = Subject.find(params[:id])
      s.name = params[:name]
      s.description = params[:desc]
      s.save
    end
    render :text => ""
  end
  
end
