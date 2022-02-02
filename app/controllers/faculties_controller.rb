class FacultiesController < ApplicationController
  def index
    @faculties = Faculty.all
  end

  def show
    @faculty = Faculty.find(params[:id])
  end

  def new
    @faculty = Faculty.new
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy
    redirect_to root_path
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def update
    @faculty = Faculty.find(params[:id])

    if @faculty.update(faculty_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @faculty = Faculty.new(faculty_params)
    if @faculty.save
    redirect_to root_path
    else
    render :new, status: :unprocessable_entity
    end
  end
    
    private
    def faculty_params
    params.require(:faculty).permit(:first_name, :last_name, :mobile, :email, :dob, :designation, :terms_of_usage)
    end

end
