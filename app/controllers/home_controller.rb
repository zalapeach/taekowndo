class HomeController < ApplicationController
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
end
