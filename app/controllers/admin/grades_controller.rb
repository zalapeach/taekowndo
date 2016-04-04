class Admin::GradesController < Admin::BaseController
  def index
    @grades = Grade.all
  end
end
