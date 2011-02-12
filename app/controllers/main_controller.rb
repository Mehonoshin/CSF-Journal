class MainController < ApplicationController
  def index
  end
  
  def tree
  end
  
  def gettree
    groups = Group.find(params['node']).groups
    json = '['
    i = 0
    
    if groups.empty?
      users = Group.find(params['node']).users
      users.each do |g|
        if i != 0
          json << ','
        end
        i += 1
        json << '{"text":"' + g.username + '","id":"' + g.id.to_s + '", "leaf" : "true"}'
      end      
    else
      groups.each do |g|
        if i != 0
          json << ','
        end
        i += 1
        json << '{"text":"' + g.description + '","id":"' + g.id.to_s + '"}'
      end
    end
    
    json << ']'
    render :text => json
  end
end
