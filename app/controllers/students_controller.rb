class StudentsController < ApplicationController

  def index
    # byebug

    if(params[:name])
      student = Student.where("first_name LIKE :search OR last_name LIKE :search", search: "%#{params[:name]}%")
      render json: student
    else
      students = Student.all
      render json: students
    end
 
  end

  def show
    student = Student.find(params[:id])
    render json: student, status: :ok
  end

end
