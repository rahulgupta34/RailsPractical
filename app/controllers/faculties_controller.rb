class FacultiesController < ApplicationController
  def index
    @faculties = Faculty.all
  end

  def new
    @faculty = Faculty.new
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
