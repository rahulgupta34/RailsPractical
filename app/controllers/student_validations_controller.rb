class StudentValidationsController < ApplicationController
  def index
     @student1s = StudentValidation.all
  end

  def show
    @student1 = StudentValidation.find(params[:id])
  end

  def new 
    @student1 = StudentValidation.new
  end

  def create
    @student1 = StudentValidation.new(student_params)
    if @student1.save
       redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @student1 = StudentValidation.find(params[:id])
    @student1.destroy
    redirect_to root_path
  end

  def edit
    @student1 = StudentValidation.find(params[:id])
  end

  def update
    @student1 = StudentValidation.find(params[:id])

    if @student1.update(student_params)
      redirect_to @student1
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
   def student_params
    params.require(:student_validation).permit(:first_name, :last_name, :phone, :email, :dob, :department)
   end
end
