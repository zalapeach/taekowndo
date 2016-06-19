class HomeController < ApplicationController
  def index
    @students = Student.sorted.page(params[:page]).per(20)
  end
end
