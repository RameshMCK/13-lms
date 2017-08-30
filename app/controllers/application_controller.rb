class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_user , :log_auth
    
    
  private
  # in ruby the private methis cann be access by the deverievd class
  #add authentication
  
  def get_user
      @user = current_user
      @is_logged_in = user_signed_in? #true fals
      @is_student = @is_logged_in && @user.role =='student'
      @is_teacher = @is_logged_in && @user.role =='teacher'
      @host = 'https://railsclass.blob.core.windows.net/classuploads'
  end
  
  
  
  
  def log_auth
    #binding.pry
    #use 
    #to_h --> to hash
    data = {controller: controller_name, action: action_name, params:request.params.to_s, time: Time.now.to_s}
    data = data.merge({uid: @user.id, email: @user.email, role: @user.role}) if @user
    
    #merge two hases
    #ap data # ap - awesome print
    #binding.pry
    #HTTParty.post('http://localhost:8082/logs', {body: {log: data}})
    PushLogsJob.perform_later(data)
  end
  
  # def log_auth
  #   data = {controller: controller_name, action: action_name, params: request.params.to_h, time: Time.now}
  #   data = data.merge({uid: @user.id, email: @user.email, role: @user.role}) if @user
  #   ap data
  # end
  
  
  def auth_teacher
      redirect_to root_url if !@is_teacher
      
  end
  
  def auth_student
      redirect_to root_url if !@is_student
  end 
end
