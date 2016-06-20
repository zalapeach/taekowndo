class Admin::StudentsController < Admin::BaseController
  def index
    @students = Student.sorted.page(params[:page]).per(20)
    if params[:search]
      @students = Student.joins(:grade, :state).
        where(
          'students.name ILIKE ? or grades.name ILIKE ? or states.name ILIKE ?
           or students.dojang ILIKE ? or students.teacher ILIKE ? or
           students.exam_age ILIKE ?',
          "%#{ params[:search] }%", "%#{ params[:search] }%",
          "%#{ params[:search] }%", "%#{ params[:search] }%",
          "%#{ params[:search] }%", "%#{ params[:search] }%",
        ).order(
          "CASE
           WHEN grades.name = '10mo Kup' THEN 1
           WHEN grades.name = '9no Kup' THEN 2
           WHEN grades.name = '8vo Kup' THEN 3
           WHEN grades.name = '7mo Kup' THEN 4
           WHEN grades.name = '6to Kup' THEN 5
           WHEN grades.name = '5to Kup' THEN 6
           WHEN grades.name = '4to Kup' THEN 7
           WHEN grades.name = '3er Kup' THEN 8
           WHEN grades.name = '2do Kup' THEN 9
           WHEN grades.name = '1er Kup' THEN 10
           WHEN grades.name = '1er Poom' THEN 11
           WHEN grades.name = '2do Poom' THEN 12
           WHEN grades.name = '3er Poom' THEN 13
           WHEN grades.name = '1er Dan' THEN 14
           WHEN grades.name = '2do Dan' THEN 15
           WHEN grades.name = '3er Dan' THEN 16
           WHEN grades.name = '4to Dan' THEN 17
           WHEN grades.name = '5to Dan' THEN 18
           WHEN grades.name = '6to Dan' THEN 19
           WHEN grades.name = '7mo Dan' THEN 20
           WHEN grades.name = '8vo Dan' THEN 21
           WHEN grades.name = '9no Dan' THEN 22
           END").page(params[:page]).per(20)
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
