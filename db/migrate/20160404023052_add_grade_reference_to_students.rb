class AddGradeReferenceToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :grade, index: true, foreign_key: true
  end
end
