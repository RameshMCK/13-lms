class CoursesController < ApplicationController
    
    # def index
    #     @courses = Course.all
    # end
    
    # def new
    #     @course = Course.new
    # end
    
    # def create
    #     @course  = Course.new(params[:course].permit(:name, :subject, :level, :credits))
    #     if @course.save
    #       redirect_to courses_path
    #     else
    #       render 'new'
    #     end 
    # end
    
    
    before_action :auth_teacher

  def index
    @courses = Course.all.order(id: 'asc')
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params[:klass].permit(:name, :subject, :level, :credits))
    if @course.save
      redirect_to courses_path
    else
      render 'new'
    end
  end
  
  
  def section_list
    @course = Course.find(params[:id])
    @section = Section.new
  end

  def section_create
    course = Course.find(params[:id])
    title = params[:section][:title]
    content = params[:section][:content]
    link = params[:section][:link]
    file = params[:section][:file]
    position = course.sections.size

    if !file.blank?
      orig = file.original_filename
      token = SecureRandom.hex(64)
      path = "#{Rails.root}/uploads/#{token}"
      FileUtils.cp file.path, path
      UploadSyllabusesJob.perform_later(course.id, title, content, link, orig, token, path, file.content_type, position)
    else
      Section.create!(course: course, title: title, content: content, link: link, position: position)
    end

    redirect_to sections_course_path(course)
  end

  def up
    course = Course.find(params[:id])
    section1 = Section.find(params[:section_id])
    section2 = course.sections.where(position: section1.position - 1).first

    if section1.position > 0
      section1.update(position: section1.position - 1)
      section2.update(position: section1.position + 1) if section2
    end

    redirect_to sections_course_path(course)
  end

  def down
    course = Course.find(params[:id])
    section1 = Section.find(params[:section_id])
    section2 = course.sections.where(position: section1.position + 1).first

    if section1.position < course.sections.size - 1
      section1.update(position: section1.position + 1)
      section2.update(position: section1.position - 1) if section2
    end

    redirect_to sections_course_path(course)
  end
  
  
  
end