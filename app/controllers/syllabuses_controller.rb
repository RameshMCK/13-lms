class SyllabusesController < ApplicationController
    before_action :auth_teacher
    
    
    # def new
    #     @course = Course.find(params[:course_id])
    #     @syllabus = Syllabus.new
    #   end
      
    def index
        @course = Course.find(params[:course_id])
        @syllabus = Syllabus.new
        @syllabuses = Syllabus.where(course_id: @course.id)
        
        #binding.pry
        
    end
    
    def show
    end
    
    def create
     
        #binding.pry
        file = params[:syllabus][:file]
        upload (file)
        name = file.original_filename
        azurepath = "#{SecureRandom.hex(64)}/#{name}"
        url = "#{@host}/#{azurepath}"
        @course = Course.find(params[:course_id])
        @syllabus = Syllabus.new(params[:syllabus].permit(:title, :content, :url))
        @syllabus.file = url
        @syllabus.course = @course
    
        #binding.pry
        
        if @syllabus.save
          redirect_to courses_url
        else
          render 'new'
        end
      end
      
    def upload (file)
        f = file #params[:file]
        orig = f.original_filename
        secure = "#{Rails.root}/uploads/#{SecureRandom.hex(64)}"
        FileUtils.cp f.path, secure
        # upload file to azure blob storage
        UploadSyllabusesJob.perform_later(orig, secure)
       # redirect_to root_path

    end      

end