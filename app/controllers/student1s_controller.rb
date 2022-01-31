class Student1sController < ApplicationController
  def index
     @student1s = Student1.all
  end

  def new 
    @student1 = Student1.new
  end

  def create
    @student1 = Student1.new(student_params)
    if @student1.save
       redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private
   def student_params
    params.require(:student1).permit(:first_name, :last_name, :phone, :email, :dob, :department)
   end
end
