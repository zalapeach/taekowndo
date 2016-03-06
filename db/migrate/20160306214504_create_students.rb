class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :danbom
      t.string :name
      t.integer :age
      t.string :state
      t.string :dojang
      t.string :teacher
      t.string :exam_age

      t.timestamps null: false
    end
  end
end
