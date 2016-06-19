class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    render 'admin/students/show'
  end
end
