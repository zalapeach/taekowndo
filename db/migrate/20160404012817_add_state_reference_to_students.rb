class AddStateReferenceToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :state, index: true, foreign_key: true
  end
end
