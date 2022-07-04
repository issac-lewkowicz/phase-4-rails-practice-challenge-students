class StudentsController < ApplicationController
  
  def index
    render json: Student.all
  end

  def create
    student = Student.create!(student_params)
    render json: student, status: :created
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

  def update
    student = Student.find(params[:id])
    student.update!(student_params)
    render json: student, status: :accepted
  end

  def destroy
    Student.find(params[:id]).destroy
    head :no_content
  end


  private

  def student_params
    params.permit(:name, :age, :major, :instructor_id)
  end


end
