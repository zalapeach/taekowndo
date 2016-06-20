class HomeController < ApplicationController
  def index
    @students = Student.unions.sorted.page(params[:page]).per(20)
  end
end
