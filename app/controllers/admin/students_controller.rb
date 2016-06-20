class Admin::StudentsController < Admin::BaseController
  def index
    if params[:search]
      @students = Student.unions.conditions(params[:search]).sorted.page(params[:page]).per(20)
    else
      @students = Student.unions.sorted.page(params[:page]).per(20)
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to admin_students_path
    else
      render :new
      @states = State.all
      @grades = Grade.all
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to admin_students_path
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to admin_students_path
  end

  private

  def student_params
    params.require(:student).permit(
      :danbom,
      :name,
      :age,
      :state_id,
      :grade_id,
      :dojang,
      :teacher,
      :exam_age
    )
  end
end
