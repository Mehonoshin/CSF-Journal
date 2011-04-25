class MainController < ApplicationController  
  before_filter :authenticate
  
  def index
    if id = session[:user_id]
      @user = User.find(id)
    end    
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
        json << '{"text":"' + g.description + '", iconCls: "group-icon", "id":"' + g.id.to_s + 'g"}'
      end
    end
    users = Group.find(params['node']).users
    users.each do |g|
      if i != 0
        json << ','
      end
      i += 1
      json << '{"text":"' + g.username + '","id":"' + g.id.to_s + 'u", iconCls: "student-icon", "leaf" : "true"}'
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
    render :text => ''
  end
  
  def delete
    if params['leaf'] != ''
      User.find(params['nodeid']).destroy
    else
      Group.find(params['nodeid']).destroy
    end
    render :text => '[{"success" : "true"}]'
  end
  
  def copy
    if (params[:append])
      User.find(params[:nodeid]).groups << Group.find(params[:newparentid])
    end
    render :text => '[{"success" : "true"}]'
  end
  
  def addgroup
    g = Group.create(:description => params[:desc], :group_id => params[:parentid])
    render :json => g.id
  end
  
  def updategroup
    g = Group.find(params[:nodeid])
    g.description = params[:desc]
    g.save
    render :text => ''
  end
  
  def delfrom
    User.find(params[:nodeid]).groups.delete(Group.find(params[:parentid]))
    render :text => ''
  end
  
  def adduser
    u = User.create(:username => params[:username], :hash => "newPass9")
    if params[:type] == 'true'
      p = Student.create(:name => params[:name], :student_number => params[:studNumber])
      u.profile_type = "Student"
    else
      u.profile_type = "Tutor"
      p = Tutor.create(:name => params[:name], :position => params[:position], :grade => params[:grade])
    end
    u.profile_id = p.id
    u.groups << Group.find(params[:group].to_i)
    u.save
    render :text => ''
  end
  
  def getuser
    u = User.find(params[:id])
    render :json => [u, u.profile]
  end
  
  def updateuser
    u = User.find(params[:id])
    u.profile.name = params[:name]
    u.username = params[:username]
    p = u.profile
    if u.profile_type == "Student"
      p.student_number = params[:studNumber]
    else
      p.position = params[:position]
      p.grade = params[:grade]
    end
    p.save
    u.save
    render :text => ''
  end
end
