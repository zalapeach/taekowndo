class Student < ActiveRecord::Base
  belongs_to :state
  belongs_to :grade

  validates :danbom, presence: true
  validates :name, presence: true
  validates :age, presence: true, numericality:
    { only_integer: true, greater_than: 0, less_than: 100 }
  validates :dojang, presence: true
  validates :teacher, presence: true
  validates :exam_age, presence: true, numericality:
    { only_integer: true, greater_than: 1900, less_than: 2100 }

  scope :unions, -> { joins(:grade, :state) }
  scope :conditions, -> (parameter) do
    where(
      'students.name ILIKE ? or grades.name ILIKE ? or states.name ILIKE ? or
       students.dojang ILIKE ? or students.teacher ILIKE ? or
       students.exam_age ILIKE ?',
      "%#{ parameter }%", "%#{ parameter }%",
      "%#{ parameter }%", "%#{ parameter }%",
      "%#{ parameter }%", "%#{ parameter }%")
  end
  scope :sorted, -> do
    order(
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
       END")
  end
end
