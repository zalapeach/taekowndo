class HomeController < ApplicationController
  def index
    if params[:search]
      @students = Student.unions.conditions(params[:search]).sorted.page(params[:page]).per(20)
    else
      @students = Student.unions.sorted.page(params[:page]).per(20)
    end
  end
end
