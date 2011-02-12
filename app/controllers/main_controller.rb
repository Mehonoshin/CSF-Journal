class MainController < ApplicationController
  def index
  end
  
  def tree
  end
  
  def gettree
    groups = Group.find(params['node']).groups
    json = '['
    i = 0
    
    if not groups.empty?
      groups.each do |g|
        if i != 0
          json << ','
        end
        i += 1
        json << '{"text":"' + g.description + '","id":"' + g.id.to_s + '"}'
      end
    end
    users = Group.find(params['node']).users
    users.each do |g|
      if i != 0
        json << ','
      end
      i += 1
      json << '{"text":"' + g.username + '","id":"' + g.id.to_s + '", "leaf" : "true"}'
    end      
    
    json << ']'
    render :text => json
  end
  
  
  def move
    if params['leaf'] != ''
      u = User.find(params['nodeid'])
      u.groups.delete(Group.find(params['oldparentid']))
      u.groups << Group.find(params['newparentid'])
      u.save
    else
      g = Group.find(params['nodeid'])
      if (g.group_id.to_s.eql?(params['oldparentid']))
        g.group_id = params['newparentid']
        g.save
      end
    end
  end
  
end
