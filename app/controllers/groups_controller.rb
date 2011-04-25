class GroupsController < ApplicationController
  before_filter :authenticate
  
  def index
    respond_to do |format|
      format.html { render :text => ""}
      format.json {
        groups = Group.find(params['node']).groups
        json = '['
        i = 0    
        if not groups.empty?
          groups.each do |g|
            if i != 0
              json << ','
            end
            i += 1
            json << '{"text":"' + g.description + '", iconCls: "group-icon", "id":"' + g.id.to_s + 'g"}'
          end
        end
        json << ']'
        render :text => json      
      }      
    end    
  end
  
  def create
  end
end
