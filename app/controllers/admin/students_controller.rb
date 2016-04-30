class Admin::StudentsController < Admin::BaseController
  def index
    @students = Student.joins(:grade).order(
      "CASE
       WHEN grades.name = '1er Poom' THEN 1
       WHEN grades.name = '2do Poom' THEN 2
       WHEN grades.name = '3er Poom' THEN 3
       WHEN grades.name = '1er Dan' THEN 4
       WHEN grades.name = '2do Dan' THEN 5
       WHEN grades.name = '3er Dan' THEN 6
       WHEN grades.name = '4to Dan' THEN 7
       WHEN grades.name = '5to Dan' THEN 8
       WHEN grades.name = '6to Dan' THEN 9
       WHEN grades.name = '7mo Dan' THEN 10
       WHEN grades.name = '8vo Dan' THEN 11
       WHEN grades.name = '9no Dan' THEN 12
       END")
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
