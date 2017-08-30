class UsersController < ApplicationController
    require 'net/http'    
    before_action :auth_teacher

  def index
    @users = User.order(id: 'asc')
  end

  def edit_role
    @roles = ['teacher', 'student']
  end

  def update_role
    user = User.where(email: params[:email]).first
    if !user
      @roles = ['teacher', 'student']
      @error = 'user does not exist'
      render 'edit_role'
    else
      user.update(role: params[:role])
      redirect_to users_path
    end
  end
  
  def logs
    #binding.pry
    #binding.pry

    @page = params[:page].to_i
    #uri = URI.parse("http://example.org")
    #logs =  HTTParty.get('http://localhost:8082/logs').parsed_response #curl localhost:8082/logs
    logs =  HTTParty.get("http://localhost:8082/logs?page=#{@page}").parsed_response #curl localhost:8082/logs

    pagesize=5
    @count = (logs['total'].to_f / pagesize.to_f).ceil
    
    @logs = logs['data']
    
    
   # @logs = JSON.parse(logs)
    
    #@page   = 3
    #per_page= 5
    #@logs = logs.limit(per_page).offset(@page * per_page) 
   # binding.pry
  end


end