class StudentsController < ApplicationController
  def index
    @student = Student.all
  end
  
  #  def show
  #   @student = Student.find(params[:id])
  #  end
   

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(article_params)

    if @student.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
      @student = Student.find(params[:id])
      @student.destroy
      redirect_to root_path, status: :see_other
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(article_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def article_params
      params.require(:student).permit(:name, :age,:email)
    end

end
